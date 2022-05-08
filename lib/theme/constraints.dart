import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/network/sharedPerefarance.dart';

String? token;
String? authorization;
String severKey =
    'AAAAYePfOOQ:APA91bHLS_LG0_h3fJ_2HzQKZ68uNjUrsXe70CT1w0EFrmYZMHVUpqYlR-Aw57L-4p4SCzB9896RPwC6gULRu-p0FfaZGHeoNkpJBIjQoeULSCSPvAN44FWhGGAwalQiUeZrb_sVg1TQ';

Widget DefaultFormField(
        {final TextEditingController? controller,
        final TextInputType? type,
        final String? label,
        final IconData? prefix,
        Function? validate,
        Function? prefixpressed,
        final String? decoration,
        bool obscureText = false}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: (s) {
        validate!(s);
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff031B31)),
          borderRadius: BorderRadius.circular(0),
        ),
        labelText: label,
        prefixIcon: prefix != null
            ? IconButton(
                onPressed: () {
                  prefixpressed!();
                },
                icon: Icon(
                  prefix,
                  color: Colors.deepOrange,
                ),
              )
            : null,
      ),
    );

Widget defaultSeparator() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

Widget defaultButton({
  @required Function? function,
  @required String? text,
  // String? color,
  // color: Color,
}) =>
    Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff031B31),
        borderRadius: BorderRadius.circular(
          3.0,
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(
          text!,
          style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 14),
        ),
      ),
    );
Widget defaultButton2({
  @required Function? function,
  @required String? text,
  // String? color,
  // color: Color,
}) =>
    Container(
      height: 40.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.deepOrange,
        borderRadius: BorderRadius.circular(
          3.0,
        ),
      ),
      child: MaterialButton(
        onPressed: () {
          function!();
        },
        child: Text(
          text!,
          style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 14),
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> route) => false,
    );
