import 'package:flutter/cupertino.dart';

class UserModel{
  String? name;
 String? phone;
 String? email;
 String? password;
 String? imageProfile;
 String? facultyName;
 String? uId;
 String? admin;
 String? tokenFcm;
 UserModel({
   this.email,
   this.facultyName,
   this.name,
   this.password,
   this.phone,
  @required this.imageProfile,
   this.uId,
   this.admin,
   this.tokenFcm
   
 });
 UserModel.fromJson(Map<String,dynamic>?json){
   name = json!['name'];
   phone = json['phone'];
   email = json['email'];
   password = json['password'];
   imageProfile = json['imageProfile'] == null ? 'https://thumbs.dreamstime.com/b/default-avatar-profile-flat-icon-social-media-user-vector-portrait-unknown-human-image-default-avatar-profile-flat-icon-184330869.jpg':json['imageProfile'];
   uId = json['uId'];
   facultyName = json['facultyName'];
   admin= json['admin'];
   tokenFcm = json['tokenFcm'];
 }

 toJson(){
  return{
    'name': name,
    'phone':phone,
    'email':email,
    'password':password,
    'imageProfile':imageProfile,
    'uId':uId,
    'facultyName':facultyName,
    'admin':admin,
    'tokenFcm':tokenFcm
  };
} 

}