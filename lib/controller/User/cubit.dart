import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/model/report.dart';
import 'package:gp/model/user_model.dart';
import 'package:gp/network/sharedPerefarance.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/auth/login.dart';
import 'package:gp/view/user/reports/delay.dart';
import 'package:gp/view/user/reports/done.dart';
import 'package:gp/view/user/reports/inprogress.dart';
import 'package:gp/view/user/reports/rufuese.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;


class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitailState());
  static UserCubit get(context)=>BlocProvider.of(context);
 UserModel ?userModel ;
   
 File? ticketImage ;
 File? profileUser;
 final ImagePicker picker = ImagePicker();
List<ReportModel> inProgress=[];
List<ReportModel> deLay = [];
List<ReportModel> done=[];
List<ReportModel> rufuese =[];
List<Widget> reportScreen= [
  DoneScreen(),
  InProgressScreen(),
  DelayScreen(),
  RufueseScreen(),
];
List<String> reportTitle= [
  'Done Screen',
  'InProgress Screen',
  'Delay Screen',
  'Rufuese Screen'
];
int currentIndex = 0;

void changeNavBar(index){
  currentIndex = index;
  emit(ChangeNaveBarState());
}
 static const priorityItem = <String>[
   'High',
   'Mediem',
   'Low'
 ];
 String prioritySelected = 'Mediem';
 final List<DropdownMenuItem<String>> dropDownMenuItems= priorityItem.map((value){
   return DropdownMenuItem<String>(
     value: value,
     child: Text(value,style: GoogleFonts.aBeeZee(),));
 } ).toList();
 void changePirority(String newValue){
   prioritySelected = newValue;
   emit(ChangeDropDownState());
 }
 getProfileData(){
  emit(getProfileDataLoadingState());
  FirebaseFirestore.instance.collection('users').doc(token).get().then((value) {
   userModel = UserModel.fromJson(value.data());
  ;
   emit(getProfileDataSuccesState());
  }).catchError((error){
    emit(getProfileDataErrorState(error.toString()));
  }); 
 }

 void pickProfileImage(src){
   emit(PickTicketImageLoadingState());
   picker.pickImage(source: src).then((value) {
     ticketImage = File(value!.path);
     emit(PickTicketImageSuccessState());
   }).catchError((error){
     emit(PickTicketImageErrorState(error.toString()));
   });
   
  }
void removeImage(){
  ticketImage = null;
  emit(RemoveImagPickState());
}
sendReportToDb(
  String name,
  String phone,
  String message,
  String ticketName,
  String facultyName,
  String ticktTime,
  String ticktDate,
  
){
emit(SendReportGpImageLoadingState());  
if(ticketImage == null){
  Fluttertoast.showToast(msg: 'Please Enter photo Problem');
}else{
 FirebaseStorage.instance.ref().child('reports/${token}/${Uri.file(ticketImage!.path).pathSegments.last}').putFile(File(ticketImage!.path)).then((valuePth) {
  valuePth.ref.getDownloadURL().then((value) {
    ReportModel reportModel = ReportModel(
      userName: name,
      priority: prioritySelected,
      userPhone: phone,
      facultyName: facultyName,
      message: message,
      tikcetName: ticketName,
      date: ticktDate,
      time: ticktTime,
      imageReport: value,
      status: 'New',
      userId: token,
      userImage: userModel!.imageProfile,
      adminId: '',
      adminName: '',
      userTokenFcm: userModel!.tokenFcm
    );
    FirebaseFirestore.instance.collection('reports').doc().set(reportModel.toJson()).then((valueFi) {
      
     Fluttertoast.showToast(msg: 'Send Report SuccessFully');
     emit(SendReportGpImageSuccessState());     
    }).catchError((error){
 emit(SendReportGpImageErrorState(error.toString()));
    });
  }).catchError((error){
     emit(SendReportGpImageErrorState(error.toString())); 
  });
 }).catchError((erorr){
   emit(SendReportGpImageErrorState(erorr.toString()));  
 });
}  
}



getDelayReports(){
  emit(GetReportDelayLoadingState());
  deLay = [];
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
      
       if(element['status'] == 'Delay' && element['userId'] == token){
         deLay.add(ReportModel.fromJson(element.data()));
       }
      emit(GetReportDelaySuccessState());
    });
    
  }).catchError((error){
   emit(GetReportDelayErrorState(error.toString()));
  });
}

getInProgressReports(){
  inProgress = [];
    emit(GetReportInprogressLoadingState());
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
      
       if(element['status'] == 'InProgress' && element['userId'] == token){
         inProgress.add(ReportModel.fromJson(element.data()));
       }
      emit(GetReportInprogressSuccessState());    
    });
    
  }).catchError((error){
   emit(GetReportInprogressErrorState(error.toString()));
  });
}

getDoneReports(){
 done=[];
    emit(GetReportDoneLoadingState());
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
     
       if(element['status'] == 'Done' && element['userId'] == token){
         done.add(ReportModel.fromJson(element.data()));
       }
      emit(GetReportDoneSuccessState());    
    });
    
  }).catchError((error){
   emit(GetReportDoneErrorState(error.toString()));
  });
}


getRufuseReports(){
  rufuese = [];
     emit(GetReportRufueseLoadingState());
  FirebaseFirestore.instance.collection('reports').get().then((value) {
    value.docs.forEach((element) { 
     
       if(element['status'] == 'Refuse' && element['userId'] == token){
         rufuese.add(ReportModel.fromJson(element.data()));
       }
      emit(GetReportRefueseSuccessState());    
    });
    
  }).catchError((error){
   emit(GetReportReufeseErrorState(error.toString()));
  }); 
}





updateProfile(String name, String phone){
   if(profileUser !=null){
     updateWithImage(name,phone);
   }else{
     updateWithOutImage(name,phone);
   }
 }

   updateWithImage(String name,String phone)  {
     firebase_storage.FirebaseStorage.instance.ref().child('users/superAdmin/${Uri.file(profileUser!.path).pathSegments.last}').putFile(File(profileUser!.path)).then((valuePath) {
        valuePath.ref.getDownloadURL().then((value)async {
           FirebaseFirestore.instance.collection('users').doc(token).update({
             'imageProfile':value,
             'name':name,
             'phone':phone,
            'tokenFcm': await FirebaseMessaging.instance.getToken()
           }).then((value) {
             getProfileData();
              emit(UpdateProfileUserSuccessState());
           }).catchError((error){
              emit(UpdateProfileUserErrorState(error.toString()));
           });
           emit(UpdateProfileUserSuccessState());  
        }).catchError((error){
          emit(UpdateProfileUserErrorState(error.toString()));
        });
     }).catchError((error){
       emit(UpdateProfileUserErrorState(error.toString()));
     });
   }

   updateWithOutImage(String name,String phone) async{
     FirebaseFirestore.instance.collection('users').doc(token).update({
       'name':name,
       'phone':phone,
       'tokenFcm': await FirebaseMessaging.instance.getToken()
     }).then((value) {
       getProfileData();
      emit(UpdateProfileUserSuccessState());  
     }).catchError((error){
        emit(UpdateProfileUserErrorState(error.toString()));
     });
     
   } 
  
  resetEmailAndPassword(String email,context){
    emit(ResetEmailAndPasswordUserGpLoadingState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
     navigateAndFinish(context, LoginScreen());
     emit(ResetEmailAndPasswordUserGpSuccessState());   
    }).catchError((error){
      emit(ResetEmailAndPasswordUserGpErrorState(error.toString()));
    });
  }

  singOutProfile(context){
    emit(SingOutScreenProfileUserLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
     CacheHelper.removeData(key: 'token');
     CacheHelper.removeData(key: 'authorization');
     navigateAndFinish(context, LoginScreen());   
    }).catchError((error){
     emit(SingOutScreenProfileUserErrorState(error.toString()));
    });
  }





 

}