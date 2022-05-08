import 'dart:io';


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/states.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/model/report.dart';
import 'package:gp/model/user_model.dart';
import 'package:gp/network/sharedPerefarance.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/admin/wokring%20reports/delay.dart';
import 'package:gp/view/admin/wokring%20reports/inprogress.dart';
import 'package:gp/view/auth/login.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class AdminCubit extends Cubit<AdminState>{
  AdminCubit() : super(AdminInitailState());
  static AdminCubit get(context)=>BlocProvider.of(context);
  int currentIndex = 0;
  UserModel? userModel;
 
 final ImagePicker picker = ImagePicker();
 File? profileImageAdmin ;
  List<ReportModel> inPrgress=[];
  List<ReportModel> neW=[];
  List<ReportModel> delay=[];
  List<ReportModel> refuese=[];
  List<ReportModel> done=[];
  List<String> reportsNew= [];
  List<String> reportsInprogress= [];
   List<String> reportsDelay= [];
   List<Widget> working= [
     delayScreen(),
     InprogrssScreen()
   ]; 
   int currentWokring= 0;
   List<String> titleWorking= [
     'Delay Screen',
     'Inprogress Screen'
   ];
   
 changeNavBarWorking(int index){
   currentWokring = index;
     emit(ChangeNavBarAdminState());
 }

  changeNaveBar(index){
    currentIndex = index;
  
  }

getDataProfileAdmin(){
 emit(GetDataProfileAdminLoadingState());
 FirebaseFirestore.instance.collection('users').doc(token).get().then((value){
   userModel = UserModel.fromJson(value.data());
   
   emit(GetDataProfileAdminsuccessState());
 }).catchError((error){
   emit(GetDataProfileAdminErrorState(error.toString()));
 }); 
}
getNewReports(){
  emit(GetNewReportsLoadingState());
  neW =[];
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
      
      if(element['status'] == 'New'){
        neW.add(ReportModel.fromJson(element.data()));
        reportsNew.add(element.id);
      }
    });
    emit(GetNewReportsSuccessState());
  }).catchError((error){
    emit(GetNewReportsErrorState(error.toString()));
  });
}

geDoneReports(){
  emit(GetDoneReportsLoadingState());
  done = [];
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
      
      if(element['status'] == 'Done' && element['adminId']== token){
        done.add(ReportModel.fromJson(element.data()));
      }
    });
    emit(GetDoneReportsSuccessState());
  }).catchError((error){
    emit(GetDoneReportsErrorState(error.toString()));
  });
}

geInprogressReports(){
  emit(GetInprogressReportsLoadingState());
  inPrgress = [];
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
      
      if(element['status'] == 'InProgress' && element['adminId']== token){
        inPrgress.add(ReportModel.fromJson(element.data()));
        reportsInprogress.add(element.id);

      }
    });
    emit(GetInprogressReportsSuccessState());
  }).catchError((error){
    emit(GetInprogressReportsErrorState(error.toString()));
  });
}

geDelayReports(){
  emit(GetDelayReportsLoadingState());
  delay = [];
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
      
      if(element['status'] == 'Delay' && element['adminId']== token){
        delay.add(ReportModel.fromJson(element.data()));
        reportsDelay.add(element.id);
      }
    });
    emit(GetDelayReportsSuccessState());
  }).catchError((error){
    emit(GetDelayReportsErrorState(error.toString()));
  });
}

geRefuseReports(){
  emit(GetRufeuseReportsLoadingState());
  refuese = [];
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
      
      if(element['status'] == 'Refuese' && element['adminId']== token ){
        refuese.add(ReportModel.fromJson(element.data()));
      }
    });
    emit(GetRufeuseReportsSuccessState());
  }).catchError((error){
    emit(GetRufeuseReportsErrorState(error.toString()));
  });
}

updateStatusReport(String reportId,String status,context,String userFcmToken){
  emit(UpdateStatusLoadingState());
  FirebaseFirestore.instance.collection('reports').doc(reportId).update({
    'status':status,
    'adminId':token,
    'adminName':userModel!.name
  }).then((value) {
    Navigator.pop(context);
     Fluttertoast.showToast(msg: 'Update Status SuccessFully');
    
    geDelayReports();
    geDoneReports();
    geInprogressReports();
    geRefuseReports();
    getNewReports();
  
    emit(UpdateStatusSuccessState());
  }).catchError((error){
    emit(UpdateStatusErrorState(error.toString()));
  });
}

void pickProfileImage(src){
   emit(PickTicketImageAdminLoadingState());
   picker.pickImage(source: src).then((value) {
     profileImageAdmin = File(value!.path);
     emit(PickTicketImageAdminSuccessState());
   }).catchError((error){
     emit(PickTicketImageAdminErrorState(error.toString()));
   });
   
  }
 resetEmailAndPassword(String email,String password,context)async{
   emit(ResetPasswordAndEmailLoadingState());
   AuthCredential credential = EmailAuthProvider.credential(email: email, password: password);

// Reauthenticate
await FirebaseAuth.instance.currentUser?.reauthenticateWithCredential(credential).then((valueAuth) {
  FirebaseFirestore.instance.collection('users').doc(token).delete().then((value) {
    UserModel update =UserModel(
      imageProfile: userModel!.imageProfile,
      name: userModel!.name,
      facultyName: userModel!.facultyName,
      password: password,
      email: email,
      uId: valueAuth.user!.uid,
      admin: 'true'
      
    );
    FirebaseFirestore.instance.collection('users').doc(valueAuth.user!.uid).set(update.toJson()).then((value) {
      Fluttertoast.showToast(msg: 'Update is SucccessFully');
  navigateAndFinish(context, LoginScreen());     
emit(ResetPasswordAndEmailSuccessState());
    }).catchError((error){});
  }).catchError((error){
    emit(ResetPasswordAndEmailErrorState(error.toString()));
     
  });
}).catchError((error){
  emit(ResetPasswordAndEmailErrorState(error.toString()));
});

 }

 updateProfile(String name, String phone){
   if(profileImageAdmin !=null){
     updateWithImage(name,phone);
   }else{
     updateWithOutImage(name,phone);
   }
 }

   updateWithImage(String name,String phone) {
     
     firebase_storage.FirebaseStorage.instance.ref().child('users/superAdmin/${Uri.file(profileImageAdmin!.path).pathSegments.last}').putFile(File(profileImageAdmin!.path)).then((valuePath) {
        valuePath.ref.getDownloadURL().then((value) {
           FirebaseFirestore.instance.collection('users').doc(token).update({
             'imageProfile':value,
             'name':name,
             'phone':phone,
              'facultyName':userModel!.facultyName,
              
           });
            getDataProfileAdmin();
           emit(UpdateProfileWithOutImageAdminSuccessState());
        }).catchError((error){
          emit(UpdateProfileWithOutImageAdminErrorState(error.toString()));
        });
     }).catchError((error){
       emit(UpdateProfileWithOutImageAdminErrorState(error.toString()));
     });
   }

   updateWithOutImage(String name,String phone) {
     FirebaseFirestore.instance.collection('users').doc(token).update({
       'name':name,
       'phone':phone,
       'facultyName':userModel!.facultyName
     }).then((value) {
       getDataProfileAdmin();
      emit(UpdateProfileWithOutImageAdminSuccessState());  
     }).catchError((error){
        emit(UpdateProfileWithOutImageAdminErrorState(error.toString()));
     });
     
   }

   singOutProfile(context){
    emit(SignOutAdminLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
     CacheHelper.removeData(key: 'token');
     CacheHelper.removeData(key: 'authorization');
     navigateAndFinish(context, LoginScreen());
     emit(SignOutAdminSuccessState());   
    }).catchError((error){
     emit(SignOutAdminErrorState(error.toString()));
    });
  }  


}