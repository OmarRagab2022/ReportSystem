import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gp/shared/shared.styles/colors.dart';
import 'colors.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.mainColor,
  primarySwatch: Colors.grey,
  scaffoldBackgroundColor: Colors.white,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.mainColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    )),
  ),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: AppColors.mainColor,
      statusBarIconBrightness: Brightness.light,
    ),
    backwardsCompatibility: false, //for states bar control
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.black),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.secondColor,
    unselectedItemColor: AppColors.mainColor,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: AppColors.secondColor,
    ),
    bodyText2: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColors.mainColor,
    ),
    headline6: TextStyle(
      fontSize: 15.0,
      fontWeight: FontWeight.bold,
      color: Colors.black87,
    ),
    headline3: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline2: TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.mainColor,
  primarySwatch: Colors.teal,
  scaffoldBackgroundColor: AppColors.darkColor,

  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    ),
    backwardsCompatibility: false, //for states bar control
    backgroundColor: AppColors.darkColor,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 25.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.darkColor,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: AppColors.mainColor,
    unselectedItemColor: AppColors.filledColor,
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.mainColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topRight: Radius.circular(25),
      topLeft: Radius.circular(25),
      bottomRight: Radius.circular(25),
    )),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white70,
    ),
    bodyText2: TextStyle(
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: AppColors.mainColor,
    ),
    headline6: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: Colors.grey,
    ),
    headline3: TextStyle(
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
    headline2: TextStyle(
      fontSize: 45.0,
      fontWeight: FontWeight.bold,
      color: Colors.white70,
    ),
  ),
  //inputDecorationTheme:

  // fixTextFieldOutlineLabel: OutlinedButtonThemeData(),
);
