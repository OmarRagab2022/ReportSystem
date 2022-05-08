import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/Admin/states.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/model/report.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/admin/report_details.dart';

class NewReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var neW = AdminCubit.get(context).neW;
        var neWIds = AdminCubit.get(context).reportsNew;
        return Scaffold(
          backgroundColor: Color(0xff031B31),
          appBar: AppBar(
            backgroundColor: Color(0xff031B31),
            elevation: 0.1,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(
              'New Reports',
              style: GoogleFonts.aBeeZee(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: ConditionalBuilder(
            condition: neW.length > 0,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(19.0),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      reportWidget(neW[index], context, neWIds[index]),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: neW.length),
            ),
            fallback: (context) => reportEmpty(),
          ),
        );
      },
    );
  }
}

Widget reportWidget(ReportModel reportModel, context, String reportId) =>
    InkWell(
      onTap: () {
        navigateTo(context, ReportDetailsScreen(reportModel, reportId));
      },
      child: Card(
        elevation: 30.3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Report Name : ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reportModel.tikcetName!,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket Time : ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reportModel.time!,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ticket Date : ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reportModel.date!,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status : ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reportModel.status!,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Priority : ',
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reportModel.priority!,
                    style: GoogleFonts.aBeeZee(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );

Widget reportEmpty() => Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/empty-box-svgrepo-com',
            color: Colors.white,
            height: 60,
            width: 60,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'No reports here ',
            style: GoogleFonts.aBeeZee(
                color: Colors.white, fontSize: 29, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
