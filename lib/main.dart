import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/auth/cubit.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/network/sharedPerefarance.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/admin/admin_layout.dart';
import 'package:gp/view/auth/login.dart';
import 'package:gp/view/auth/onBoarding.dart';
import 'package:gp/view/superAdmin/super_admin_layout.dart';
import 'package:gp/view/user/user_home_layout.dart';
import 'package:dcdg/dcdg.dart';

Future<void> firebaseMessagingBackGroundHandler(RemoteMessage message) async {
  print(message.data);
  Fluttertoast.showToast(msg: 'Hello');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CacheHelper.init();
  //fcm foreground
  FirebaseMessaging.onMessage.listen((event) {
    print(event.data);
    Fluttertoast.showToast(msg: 'Hello');
  });

  //fcm back ground
  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    print(event.data);
    Fluttertoast.showToast(msg: 'Hello');
  });
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackGroundHandler);
  token = CacheHelper.getData(key: 'token');
  authorization = CacheHelper.getData(key: 'authorization');
  Widget? widget;
  if (token != null) {
    if (authorization == 'superAdmin') {
      widget = SuperAdminLayOut();
    } else if (authorization == 'Admin') {
      widget = AdminLayOut();
    } else {
      widget = UserHomeScreen();
    }
  } else {
    widget = OnBoardingScreen();
  }
  runApp(MyApp(
    widget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget? widget;
  MyApp({this.widget}); // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AdminCubit()
              ..geDelayReports()
              ..geDoneReports()
              ..geInprogressReports()
              ..geRefuseReports()
              ..getDataProfileAdmin()
              ..getNewReports()),
        BlocProvider(create: (context) => AdminGpCubit()),
        BlocProvider(
            create: (context) => UserCubit()
              ..getProfileData()
              ..getDelayReports()
              ..getDoneReports()
              ..getInProgressReports()
              ..getRufuseReports()),
        BlocProvider(
            create: (context) => SuperAdminGpCubit()
              ..getProfileData()
              ..getAdminsFromDb()
              ..getUsersFromDb()
              ..getDelayReports()
              ..getInprogessReports()
              ..getDoneReports()
              ..getRefueseReports()
              ..putChartSeires())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: widget,
      ),
    );
  }
}
