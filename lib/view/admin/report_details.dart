import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/Admin/reportDetails/cubit.dart';
import 'package:gp/controller/Admin/reportDetails/states.dart';
import 'package:gp/controller/Admin/states.dart';
import 'package:gp/model/report.dart';

class ReportDetailsScreen extends StatelessWidget {
  ReportModel report;
  String reportId;
  ReportDetailsScreen(this.report, this.reportId);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ReportDetailsAdminCubit()..getReportDetailsFromDb(reportId),
      child: BlocConsumer<ReportDetailsAdminCubit, ReportAdminDetailsState>(
        listener: (context, state) {
          if (state is UpdateStatusSuccessState) {
            AdminCubit.get(context).geDelayReports();
            AdminCubit.get(context).geDoneReports();
            AdminCubit.get(context).getNewReports();
            AdminCubit.get(context).geInprogressReports();
            AdminCubit.get(context).geRefuseReports();
            Fluttertoast.showToast(msg: 'Update SuccessFully');
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = ReportDetailsAdminCubit.get(context);

          return ConditionalBuilder(
            condition: cubit.reportModel != null,
            builder: (context) => Scaffold(
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
                  'Report Details',
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                centerTitle: true,
                actions: [
                  MaterialButton(
                    onPressed: () {
                      cubit.updateStatusReport(
                          reportId, context, report.userTokenFcm!);
                    },
                    child: Text(
                      'Update',
                      style: GoogleFonts.aBeeZee(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                    ),
                  )
                ],
              ),
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(report.userImage!),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      reportItem(
                          name: 'Admin Name',
                          reportName: cubit.reportModel!.adminName!),
                      const SizedBox(
                        height: 30,
                      ),
                      reportItem(name: 'Name', reportName: report.userName),
                      const SizedBox(
                        height: 30,
                      ),
                      reportItem(
                          name: 'TikcetName', reportName: report.tikcetName),
                      const SizedBox(
                        height: 30,
                      ),
                      reportItem(name: 'TikcetTime', reportName: report.time),
                      const SizedBox(
                        height: 30,
                      ),
                      reportItem(name: 'TikcetDate', reportName: report.date),
                      const SizedBox(
                        height: 30,
                      ),
                      reportItem(name: 'Priority', reportName: report.priority),
                      const SizedBox(
                        height: 30,
                      ),
                      reportMessageItem(
                          name: 'Tikcet message', reportName: report.message),
                      const SizedBox(
                        height: 30,
                      ),
                      ListTile(
                        title: Text(
                          'Status',
                          style: GoogleFonts.aBeeZee(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w400),
                        ),
                        trailing: DropdownButton(
                          style: GoogleFonts.montserrat(
                              color: Colors.deepOrange, fontSize: 20),
                          dropdownColor: Colors.white,
                          value: cubit.reportModel!.status,
                          items: cubit.dropDownMenuItemsAdmin,
                          onChanged: (String? value) {
                            if (value!.isNotEmpty) {
                              cubit.changeStatus(value);
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}

Widget reportItem({String? name, String? reportName}) => Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name!,
          style: GoogleFonts.aBeeZee(
              color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
        ),
        Container(
          height: 35,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.circular(2)),
          child: Center(
            child: Text(
              reportName != null ? reportName : 'Error',
              style: GoogleFonts.aBeeZee(
                  color: Colors.deepOrange,
                  fontSize: 19,
                  fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );

Widget reportMessageItem({String? name, String? reportName}) =>
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name!,
            style: GoogleFonts.aBeeZee(
                color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
          ),
          Container(
            height: 90,
            width: 350,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(2)),
            child: Center(
              child: Text(
                reportName!,
                style: GoogleFonts.aBeeZee(
                    fontSize: 19,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.w400),
              ),
            ),
          )
        ],
      ),
    );
