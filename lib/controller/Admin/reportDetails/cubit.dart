import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/Admin/reportDetails/states.dart';
import 'package:gp/model/report.dart';
import 'package:gp/theme/constraints.dart';
import 'package:http/http.dart' as http;

class ReportDetailsAdminCubit extends Cubit<ReportAdminDetailsState>{
  ReportDetailsAdminCubit() : super(ReportAdminInitailState());
  static ReportDetailsAdminCubit get(context)=>BlocProvider.of(context);
  ReportModel? reportModel ;
   
 
static const statusItem = <String>[
   'Done',
   'InProgress',
   'Refuse',
   'New',
   'Delay'
 ];
  List<DropdownMenuItem<String>> dropDownMenuItemsAdmin= statusItem.map((value){
   return DropdownMenuItem<String>(
     value: value,
     child: Text(value,style: GoogleFonts.aBeeZee(),));
 } ).toList();
String ? status ;
 
 void changeStatus(String newValue){
   reportModel!.status = newValue;
   emit(ChangeDropDownAdmin());
 }

 getReportDetailsFromDb(String reportId){
   emit(GetReportAdminLoadingFromDb());
   FirebaseFirestore.instance.collection('reports').doc(reportId).get().then((value) {
     reportModel = ReportModel.fromJson(value.data());
     status = reportModel!.status;
   
   }).catchError((error){
     emit(GetReportAdminErrorFromDb(error.toString()));
   });
 }
 



updateStatusReport(String reportId,context,String userTokenFcm){
  emit(UpdateReportAdminLoadingFromDb());
  FirebaseFirestore.instance.collection('reports').doc(reportId).update({
    'status':reportModel!.status,
    'adminId':token,
    'adminName': AdminCubit.get(context).userModel!.name
  }).then((value) async{
    AdminCubit.get(context).geDelayReports();
    AdminCubit.get(context).geDoneReports();
    AdminCubit.get(context).geInprogressReports();
    AdminCubit.get(context).geRefuseReports();
    AdminCubit.get(context).getNewReports();
    
    try{
       http.Response response = await http.post(
      Uri.parse('https://fcm.googleapis.com/fcm/send'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'key= $severKey ',
      },
      body: jsonEncode(
        <String, dynamic>{
          'notification': <String, dynamic>{
            'body': '${reportModel!.tikcetName}',
            'title': '${reportModel!.message}'
          },
          'priority': 'high',
          'data': <String, dynamic>{
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'id': '1',
            'status': 'done'
          },
          'to': '$userTokenFcm',
        },
      ),
    );
    }catch(e){
       Fluttertoast.showToast(msg: 'Somthing is Problem');
    }
    Fluttertoast.showToast(msg: 'Update Status SuccessFully');
    Navigator.pop(context);
    emit(UpdateReportAdminSuccessFromDb());
  }).catchError((error){
    emit(UpdateReportAdminErrorFromDb(error.toString()));
  });
}


}