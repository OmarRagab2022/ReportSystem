import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/model/report.dart';

class RufueseScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var rufuese = UserCubit.get(context).rufuese;
        return RefreshIndicator(
          onRefresh: () => UserCubit().getRufuseReports(),
          child: Scaffold(
            backgroundColor: Color(0xff031B31),
            body: Padding(
              padding: const EdgeInsets.all(17.0),
              child: ConditionalBuilder(
                condition: rufuese.length > 0,
                builder: (context) => ListView.separated(
                    itemBuilder: (context, index) =>
                        reportWidget(rufuese[index]),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: rufuese.length),
                fallback: (context) => reportEmpty(),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget reportWidget(ReportModel reportModel) => Card(
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
                  reportModel.tikcetName! == null
                      ? ''
                      : reportModel.tikcetName!,
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
    );

Widget reportEmpty() => Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/empty-box-svgrepo-com',
            color: Colors.grey,
            height: 60,
            width: 60,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            'No reports here ',
            style: GoogleFonts.aBeeZee(
                color: Colors.grey, fontSize: 29, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
