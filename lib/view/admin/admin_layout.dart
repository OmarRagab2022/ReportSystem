import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/Admin/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/admin/done_reports.dart';
import 'package:gp/view/admin/new_reports.dart';
import 'package:gp/view/admin/update%20_profile.dart';

import 'package:gp/view/admin/wokring_reports.dart';

class AdminLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.userModel != null,
          builder: (context) => Scaffold(
            backgroundColor: Color(0xff031B31),
            appBar: AppBar(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Color(0xff031B31),
                statusBarBrightness: Brightness.light,
              ),
              backgroundColor: Color(0xff031B31),
              elevation: 0.4,
              /* leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    navigateTo(context, UpdateProfileScreen());
                  },
                  child: CircleAvatar(
                    radius: 10,
                    backgroundImage:
                        NetworkImage(cubit.userModel!.imageProfile!),
                  ),
                ),
              ),*/
              title: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Home ...',
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.message,
                        color: Colors.deepOrange,
                      )),
                )
              ],
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            navigateTo(context, UpdateProfileScreen());
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Container(
                              width: 70.0,
                              height: 70.0,
                              child: CircleAvatar(
                                radius: 5.0,
                                backgroundImage: NetworkImage(
                                  cubit.userModel!.imageProfile!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Hi ' + cubit.userModel!.name!,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.deepOrange,
                            fontSize: 22,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 20.0,
                        ),
                        Text(
                          'Lets continue Our work ! ',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              cubit.getNewReports();
                              navigateTo(context, NewReportsScreen());
                            },
                            child: SizedBox(
                              height: 160,
                              width: 160,
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Show  New Reports',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                            color: Color(0xff031B31),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/report-svgrepo-com.svg',
                                        height: 70,
                                        width: 70,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          InkWell(
                            onTap: () {
                              cubit.geDelayReports();
                              cubit.geInprogressReports();

                              navigateTo(context, WorkingReportsScreen());
                            },
                            child: SizedBox(
                              height: 160,
                              width: 160,
                              child: Card(
                                color: Colors.white,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          'Show Working Reports',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xff031B31),
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/report-svgrepo-com.svg',
                                        height: 70,
                                        width: 70,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        cubit.geDoneReports();
                        navigateTo(context, DoneReportsScreen());
                      },
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Show  Done Reports',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xff031B31),
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                SvgPicture.asset(
                                  'assets/images/report-svgrepo-com.svg',
                                  height: 70,
                                  width: 70,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
