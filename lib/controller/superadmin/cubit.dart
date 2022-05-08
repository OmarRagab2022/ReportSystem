import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/model/report.dart';
import 'package:gp/model/task.dart';
import 'package:gp/model/user_model.dart';
import 'package:gp/network/sharedPerefarance.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/admin/done_reports.dart';
import 'package:gp/view/admin/wokring%20reports/delay.dart';
import 'package:gp/view/admin/wokring%20reports/inprogress.dart';
import 'package:gp/view/auth/login.dart';
import 'package:gp/view/superAdmin/UsersAdmins/admins.dart';
import 'package:gp/view/superAdmin/UsersAdmins/users.dart';
import 'package:gp/view/superAdmin/add_user.dart';
import 'package:gp/view/superAdmin/reports/done_screen.dart';
import 'package:gp/view/superAdmin/reports/inprogress_screen.dart';
import 'package:gp/view/superAdmin/reports/refuese_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class SuperAdminGpCubit extends Cubit<SuperAdminGPState> {
  SuperAdminGpCubit() : super(SuperAdminGPInitailState());
  static SuperAdminGpCubit get(context) => BlocProvider.of(context);
  File? proFileImage;
  File? proFileAdminImage;
  File? proFileUserImage;
  List<ReportModel> inProgress = [];
  List<ReportModel> delay = [];
  List<ReportModel> done = [];
  List<ReportModel> refuese = [];
  int currentReportsIndex = 0;
  List<Widget> reportsScreen = [
    DoneeReportssScreen(),
    InProgressReportsScreen(),
    delayScreen(),
    RefueseReportsScreen()
  ];
  List<String> titleScreen = [
    'Done Screen',
    'InProgress Screen',
    'Delay Screen',
    'Refuese Screen'
  ];
  final ImagePicker picker = ImagePicker();
  int currentIndex = 0;
  List<String> titles = ['Users', 'Admins'];
  List<Widget> screens = [
    UsersScreen(),
    AdminsScreen(),
  ];

  UserModel? superAdmin;

  List<UserModel> users = [];
  List<UserModel> admins = [];

  List<GDPData> getGDPdata() {
    final List<GDPData> chartData = [
      GDPData('InProgress', 5),
      GDPData('Delay', 4),
      GDPData('Done', 6),
      GDPData('Refues', 3)
    ];

    return chartData;
  }

  late List<GDPData> chartData;

  putChartSeires() {
    chartData = getGDPdata();
    emit(ChartSeriesLoading());
  }

  getProfileData() {
    emit(SuperAdminGetYouerDataLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(token)
        .get()
        .then((value) {
      superAdmin = UserModel.fromJson(value.data());

      emit(SuperAdminGetYouerDataSuccessState());
    }).catchError((error) {
      emit(SuperAdminGetYouerDataErrorState(error.toString()));
    });
  }

  void pickProfileImage(src) {
    emit(PickImagePorFileGpLoadingState());
    picker.pickImage(source: src).then((value) {
      proFileImage = File(value!.path);
      emit(PickImagePorFileGpSuccessState());
    }).catchError((error) {
      emit(PickImagePorFileGpErrorState(error.toString()));
    });
  }

  void pickProFileAdminImage(src) {
    emit(PickImagePorFileGpLoadingState());
    picker.pickImage(source: src).then((value) {
      proFileAdminImage = File(value!.path);
      emit(PickImagePorFileGpSuccessState());
    }).catchError((error) {
      emit(PickImagePorFileGpErrorState(error.toString()));
    });
  }

  void pickProfileUserImage(src) {
    emit(PickImagePorFileGpLoadingState());
    picker.pickImage(source: src).then((value) {
      proFileUserImage = File(value!.path);
      emit(PickImagePorFileGpSuccessState());
    }).catchError((error) {
      emit(PickImagePorFileGpErrorState(error.toString()));
    });
  }

  void updateImageWithImage({
    String? name,
    String? phone,
  }) {}

  void updateImageWithoutImage() {}

  void createAdminProfile({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? facultyName,
  }) {
    emit(CreateAdminGpLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'users/Admin/${Uri.file(proFileAdminImage!.path).pathSegments.last}')
        .putFile(File(proFileAdminImage!.path))
        .then((value) {
      value.ref.getDownloadURL().then((valuePhoto) {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!)
            .then((valueAuth) {
          UserModel admin = UserModel(
              name: name!,
              phone: phone!,
              email: email,
              password: password,
              imageProfile: valuePhoto,
              facultyName: facultyName!,
              admin: 'true',
              uId: valueAuth.user!.uid,
              tokenFcm: '');
          FirebaseFirestore.instance
              .collection('users')
              .doc(admin.uId)
              .set(admin.toJson())
              .then((value) {
            emit(CreateAdminGpSuccesState());
          }).catchError((error) {
            emit(CreateUserGpErrorState(error.toString()));
          });
        }).catchError((error) {
          emit(CreateAdminGpErrorState(error.toString()));
        });
      }).catchError((error) {
        emit(CreateAdminGpErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(CreateAdminGpErrorState(error.toString()));
    });
  }

  void createUserProfiel({
    String? name,
    String? phone,
    String? email,
    String? password,
    String? facultyName,
  }) {
    emit(CreateUserGpLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'users/User/${Uri.file(proFileUserImage!.path).pathSegments.last}')
        .putFile(File(proFileUserImage!.path))
        .then((value) {
      value.ref.getDownloadURL().then((valuePhoto) {
        FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email!, password: password!)
            .then((valueAuth) {
          UserModel user = UserModel(
              name: name!,
              phone: phone!,
              email: email,
              password: password,
              imageProfile: valuePhoto,
              facultyName: facultyName!,
              admin: 'false',
              uId: valueAuth.user!.uid,
              tokenFcm: '');
          FirebaseFirestore.instance
              .collection('users')
              .doc(user.uId)
              .set(user.toJson())
              .then((value) {
            emit(CreateUserGpSuccesState());
          }).catchError((error) {
            emit(CreateUserGpErrorState(error.toString()));
          });
        }).catchError((error) {
          emit(CreateUserGpErrorState(error.toString()));
        });
      }).catchError((error) {
        emit(CreateUserGpErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(CreateUserGpErrorState(error.toString()));
    });
  }

  updateProfile(String name, String phone) {
    if (proFileImage != null) {
      updateWithImage(name, phone);
    } else {
      updateWithOutImage(name, phone);
    }
  }

  updateWithImage(String name, String phone) {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
            'users/superAdmin/${Uri.file(proFileImage!.path).pathSegments.last}')
        .putFile(File(proFileImage!.path))
        .then((valuePath) {
      valuePath.ref.getDownloadURL().then((value) {
        FirebaseFirestore.instance
            .collection('users')
            .doc(token)
            .update({'imageProfile': value, 'name': name, 'phone': phone}).then(
                (value) {
          getProfileData();
          emit(UpdateProfileSuperAdminSuccessState());
        }).catchError((error) {
          emit(UpdateProfileSuperAdminErrorState(error.toString()));
        });

        emit(UpdateProfileSuperAdminSuccessState());
      }).catchError((error) {
        emit(UpdateProfileSuperAdminErrorState(error.toString()));
      });
    }).catchError((error) {
      emit(UpdateProfileSuperAdminErrorState(error.toString()));
    });
  }

  updateWithOutImage(String name, String phone) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(token)
        .update({'name': name, 'phone': phone}).then((value) {
      getProfileData();

      emit(UpdateProfileSuperAdminSuccessState());
    }).catchError((error) {
      emit(UpdateProfileSuperAdminErrorState(error.toString()));
    });
  }

  resetEmailAndPassword(String email, context) {
    emit(ResetEmailAndPasswordGpLoadingState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) {
      navigateAndFinish(context, LoginScreen());
      emit(ResetEmailAndPasswordGpSuccessState());
    }).catchError((error) {
      emit(ResetEmailAndPasswordGpErrorState(error.toString()));
    });
  }

  singOutProfile(context) {
    emit(SingOutScreenProfileLoadingState());
    FirebaseAuth.instance.signOut().then((value) {
      CacheHelper.removeData(key: 'token');
      CacheHelper.removeData(key: 'authorization');
      navigateAndFinish(context, LoginScreen());
    }).catchError((error) {
      emit(SingOutScreenProfileErrorState(error.toString()));
    });
  }

  getUsersFromDb() {
    emit(GetUsersFromDbLoadingState());
    admins = [];
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element['admin'] == 'false') {
          print(element.data());
          users.add(UserModel.fromJson(element.data()));
        }
      });
      emit(GetUsersFromDbSuccessState());
    }).catchError((error) {
      emit(GetUsersFromDbErrorState(error.toString()));
    });
  }

  getAdminsFromDb() {
    emit(GetUsersFromDbLoadingState());
    users = [];
    FirebaseFirestore.instance.collection('users').get().then((value) {
      value.docs.forEach((element) {
        if (element['admin'] == 'true' &&
            element['email'] != 'monanaser2021@gmail.com') {
          admins.add(UserModel.fromJson(element.data()));
          print(admins);
        }
        emit(GetUsersFromDbSuccessState());
      });
    }).catchError((error) {
      emit(GetUsersFromDbErrorState(error.toString()));
    });
  }

  changeNavBarScreen(index) {
    currentIndex = index;
    emit(ChangeNavBarState());
  }

  removeAnyUser(String uId) {
    emit(RemoveAnyUserLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .delete()
        .then((value) {
      getAdminsFromDb();
      getUsersFromDb();

      emit(RemoveAnyUserSuccessState());
    }).catchError((error) {
      Fluttertoast.showToast(msg: error.toString());
      emit(RemoveAnyUserErrorState(error.toString()));
    });
  }

  changeNavBarReportsScreen(index) {
    currentReportsIndex = index;
    emit(ChangeNavBarReportsScreen());
  }

  getInprogessReports() {
    emit(GetInprogressReportsSuperLoadingState());
    inProgress = [];
    FirebaseFirestore.instance.collection('reports').get().then((value) {
      value.docs.forEach((element) {
        if (element['status'] == 'InProgress') {
          inProgress.add(ReportModel.fromJson(element.data()));
        }
        emit(GetInprogressReportsSuperSuccessState());
      });
    }).catchError((error) {
      emit(GetInprogressReportsSuperErrorState());
    });
  }

  getDelayReports() {
    emit(GetDelayReportsSuperLoadingState());
    delay = [];
    FirebaseFirestore.instance.collection('reports').get().then((value) {
      value.docs.forEach((element) {
        if (element['status'] == 'Delay') {
          delay.add(ReportModel.fromJson(element.data()));
        }
        emit(GetDelayReportsSuperSuccessState());
      });
    }).catchError((error) {
      emit(GetDelayReportsSuperErrorState());
    });
  }

  getDoneReports() {
    emit(GetDoneReportsSuperLoadingState());
    done = [];
    FirebaseFirestore.instance.collection('reports').get().then((value) {
      value.docs.forEach((element) {
        if (element['status'] == 'Done') {
          print(element.data());
          done.add(ReportModel.fromJson(element.data()));
          print(done.length);
        }
        emit(GetDoneReportsSuperSuccessState());
      });
    }).catchError((error) {
      emit(GetDoneReportsSuperErrorState());
    });
  }

  getRefueseReports() {
    emit(GetRefueseReportsSuperLoadingState());
    refuese = [];
    FirebaseFirestore.instance.collection('reports').get().then((value) {
      value.docs.forEach((element) {
        if (element['status'] == 'Refuse') {
          refuese.add(ReportModel.fromJson(element.data()));
        }
        emit(GetRefueseReportsSuperSuccessState());
      });
    }).catchError((error) {
      emit(GetRefueseReportsSuperErrorState());
    });
  }
}
