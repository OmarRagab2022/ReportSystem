class ReportModel{
 String? userName;
 String? message;
 String? userImage;
 String? userPhone;
 String? userId;
 String? imageReport;
 String? tikcetName;
 String? time;
 String? date;
 String? priority;
 String? facultyName;
 String? status;
 String? adminId;
 String? adminName;
 String? reportId;
 String ? userTokenFcm;
  ReportModel({this.userName, this.message, this.userImage, this.userPhone, this.userId, this.imageReport, this.tikcetName,this.priority,this.time,this.facultyName,this.status,this.date,this.adminId,this.adminName,this.reportId,this.userTokenFcm});  
ReportModel.fromJson(Map<String,dynamic>?json){
 userName = json!['userName'];
 message = json['message'];
 userPhone = json[' userPhone'];
 userImage = json['userImage'];
 imageReport = json['imageReport'];
 userId = json['userId'];
 tikcetName = json['tikcetName'];
 priority = json['priority'];
 time = json['time'];
 facultyName= json['facultyName'];
 status= json['status'];
 date = json['date'];
 adminId=json['adminId'];
 adminName= json['adminName'];
 reportId = json['reportId'];
 userTokenFcm = json['userTokenFcm'];
}
toJson(){
  return{
    'userName':userName,
    'userPhone':userPhone,
    'userImage':userImage,
    'userId':userId,
    'tikcetName':tikcetName,
    'imageReport':imageReport,
    'message':message,
    'time':time,
    'priority':priority,
    'facultyName':facultyName,
    'status':status,
    'date':date,
    'adminId':adminId,
    'adminName': adminName,
    'reportId':reportId,
    'userTokenFcm':userTokenFcm
    
  };
}
}