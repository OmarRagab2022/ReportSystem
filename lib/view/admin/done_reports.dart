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

class DoneReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var done = AdminCubit.get(context).done;

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
              'Done Reports',
              style: GoogleFonts.aBeeZee(
                  color: Colors.white, fontWeight: FontWeight.w400),
            ),
            centerTitle: true,
          ),
          body: ConditionalBuilder(
            condition: done.length > 0,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(19.0),
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      reportWidget(done[index], context),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: done.length),
            ),
            fallback: (context) => reportEmpty(),
          ),
        );
      },
    );
  }
}

Widget reportWidget(ReportModel reportModel, context) => InkWell(
      onTap: () {},
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
                    'report name : ',
                    style: GoogleFonts.aBeeZee(
                        color: Colors.deepOrange,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    reportModel.tikcetName!,
                    style: GoogleFonts.aBeeZee(
                        color: Colors.deepOrange,
                        fontSize: 15,
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
                    'ticket time : ',
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
                    'ticket date : ',
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
                    'status : ',
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
                    'priority : ',
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
