// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/auth/cubit.dart';
import 'package:gp/controller/auth/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/theme/theme.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var userPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminGpCubit, LoginAppGpStates>(
      listener: (context, state) {
        if (state is LoginAppStateErrorState) {
          Fluttertoast.showToast(msg: state.error);
        } else {}
      },
      builder: (context, state) {
        var cubit = AdminGpCubit.get(context);
        return Scaffold(
          //backgroundColor: Color(0xff034c52),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 150,
                horizontal: 20,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        'Welcome !',
                        style: TextStyle(
                          color: Color(0xff031B31),
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    Center(
                      child: Text(
                        'Sign in to continue .. ',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                        // child: Text('Login', style: subtitle),
                        ),
                    const SizedBox(
                      height: 25,
                    ),
                    //Text('UserName', style: title),
                    const SizedBox(
                      height: 19,
                    ),
                    DefaultFormField(
                      controller: userNameController,
                      type: TextInputType.emailAddress,
                      label: 'Email',
                      prefix: Icons.email,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return ('Email must not be empty');
                        }
                        return null;
                      },
                    )
                    /*DefaultFormField(
                        controller: userNameController,
                        type: TextInputType.text,
                        prefix: Icons.person,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'please Enter UserName';
                          }
                          return null;
                        }),*/
                    ,
                    const SizedBox(
                      height: 19,
                    ),
                    //Text('Password', style: title),
                    const SizedBox(
                      height: 9,
                    ),
                    DefaultFormField(
                        controller: userPasswordController,
                        type: TextInputType.visiblePassword,
                        prefix: Icons.lock,
                        label: 'Password',
                        obscureText: true,
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'enter youer Password';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 50,
                    ),
                    defaultButton(
                      function: () {
                        if (formKey.currentState!.validate()) {
                          cubit.loginScreen(userNameController.text,
                              userPasswordController.text, context);
                        } else {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                elevation: 3,
                                title: Text(
                                  ' Warning ! ',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20,
                                  ),
                                ),
                                content: Container(
                                  height: 70,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Your Password is Wrong Please Enter It Correctly',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      },
                      text: 'Login',
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
