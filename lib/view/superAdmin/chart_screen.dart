
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/model/report.dart';
import 'package:gp/model/task.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartScreen extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit,SuperAdminGPState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar:  AppBar(
            backgroundColor: Colors.white,elevation: 0.1,
            leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),),
          ),
          body: Padding(
           padding: const EdgeInsets.all(8.9),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Center(child: Text('Chart Report Screen',style: GoogleFonts.aBeeZee(
                 fontSize:24,
                 color: Colors.black,
                 fontStyle: FontStyle.italic
               ),),),
               const SizedBox(height: 15,),
               SfCircularChart(
                 legend: Legend(isVisible:  true,overflowMode:LegendItemOverflowMode.wrap,),
                 series: <CircularSeries>[
                   
                   PieSeries<GDPData,String>(
                     dataSource: SuperAdminGpCubit.get(context).chartData,
                     xValueMapper: (GDPData data,_)=>data.contninet,
                     yValueMapper: (GDPData data,_)=>data.gdp,
                     dataLabelSettings:DataLabelSettings(isVisible:  true), 
                   )
                 ],
               )
             ],
           ),
          ),
        );
      },
    );
  }
} 

