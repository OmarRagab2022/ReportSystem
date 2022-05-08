
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/model/report.dart';
import 'package:gp/theme/constraints.dart';

class DelayScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit,UserState>(
      listener: (context,state){},
      builder: (context,state){
        var delay = UserCubit.get(context).deLay;
          
        return Scaffold(
          body: ConditionalBuilder(
            condition: delay.length > 0, 
            builder: (context)=>Padding(
              padding: const EdgeInsets.all(19.0),
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=>reportWidget(delay[index]), 
                separatorBuilder: (context,index)=>SizedBox(height: 10,), 
                itemCount: delay.length),
            ),
              fallback: (context)=>reportEmpty(),
            
            ),
        );
      },
    );
  }
}

Widget reportWidget(ReportModel reportModel)=>Card(
  elevation: 4.3,
  color: Colors.amberAccent,
  child: Padding(
    padding: const EdgeInsets.all(19.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Text('report name : ',style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            Text(reportModel.tikcetName!,style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),)
          ],),
        const SizedBox(height: 15,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Text('ticket time : ',style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            Text(reportModel.time!,style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            
          ],),
          const SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Text('ticket date : ',style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            Text(reportModel.date!,style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            
          ],),
          const SizedBox(height: 15,),Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Text('status : ',style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            Text(reportModel.status!,style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            
          ],),
          const SizedBox(height: 15,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween ,
          children: [
            Text('priority : ',style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            Text(reportModel.priority!,style: GoogleFonts.aBeeZee(
              fontSize: 20,
              fontWeight: FontWeight.w200
            ),),
            
          ],),
          const SizedBox(height: 15,)   
      ],
    ),
  ),
);


Widget reportEmpty()=>Center(child: Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    SvgPicture.asset('assets/images/empty-box-svgrepo-com',color: Colors.grey,height: 60,width: 60,),
    const SizedBox(height: 12,),
    Text('No reports here ',style: GoogleFonts.aBeeZee(
      color: Colors.grey,
      fontSize:29,
      fontWeight:FontWeight.w400
    ),)
  ],
),);