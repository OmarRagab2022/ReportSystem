import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/auth/states.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/model/user_model.dart';
import 'package:gp/network/sharedPerefarance.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/admin/admin_layout.dart';
import 'package:gp/view/superAdmin/super_admin_layout.dart';
import 'package:gp/view/user/user_home_layout.dart';

class AdminGpCubit extends Cubit<LoginAppGpStates>{
  AdminGpCubit() : super(LoginAppGpInitailsStates());
  static AdminGpCubit get(context)=>BlocProvider.of(context);


 
void loginScreen(String email,String password, context){
 emit(LoginAppStateLoadingState());
 FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value) {
 if(value.user!.email == 'monanaser2021@gmail.com'){
   CacheHelper.putData(key: 'token', value: value.user!.uid);
    CacheHelper.putData(key: 'authorization', value: 'superAdmin');
    SuperAdminGpCubit.get(context).getProfileData();
    SuperAdminGpCubit.get(context).getAdminsFromDb();
    SuperAdminGpCubit.get(context).getUsersFromDb();
    SuperAdminGpCubit.get(context).getDoneReports();
    SuperAdminGpCubit.get(context).getInprogessReports();
    SuperAdminGpCubit.get(context).getRefueseReports();
    SuperAdminGpCubit.get(context).getDelayReports();
   navigateTo(context, SuperAdminLayOut());
 }else {
FirebaseFirestore.instance.collection('users').doc(value.user!.uid).get().then((value) {
UserModel userModel = UserModel.fromJson(value.data());
if(userModel.admin == 'true'){
  CacheHelper.putData(key: 'token', value: userModel.uId);
  CacheHelper.putData(key: 'authorization', value: 'Admin');
  print('Admin');
  print(userModel.phone);
  AdminCubit.get(context).getDataProfileAdmin();
  AdminCubit.get(context).geDelayReports();
  AdminCubit.get(context).geInprogressReports();
  AdminCubit.get(context).getNewReports();
  AdminCubit.get(context).geRefuseReports();
  navigateTo(context, AdminLayOut());
}else{
   CacheHelper.putData(key: 'token', value: userModel.uId);
   CacheHelper.putData(key: 'authorization', value: 'User');
   UserCubit.get(context).getProfileData();
   UserCubit.get(context).getDelayReports();
   UserCubit.get(context).getDoneReports();
   UserCubit.get(context).getInProgressReports();
   UserCubit.get(context).getRufuseReports();
   navigateTo(context, UserHomeScreen());
  print('User');
}
emit(LoginAppStateSuccessState());
}).catchError((error){

emit(LoginAppStateErrorState(error.toString()));
});
  
 }
  emit(LoginAppStateSuccessState());
 }).catchError((error){
   emit(LoginAppStateErrorState(error.toString()));
 });
}


}