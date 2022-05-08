import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/user/reports/delay.dart';
import 'package:gp/view/user/reports/report_layout.dart';
import 'package:gp/view/user/send_report.dart';
import 'package:gp/view/user/update_profile.dart';

import 'about.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = UserCubit.get(context);
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
              elevation: 0.0,
              /*leading: InkWell(
                onTap: () {
                  cubit.getProfileData();
                  navigateTo(context, UpdateProfile());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundImage:
                        NetworkImage(cubit.userModel!.imageProfile!),
                  ),
                ),
              ), */
              title: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Home',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              centerTitle: false,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.message,
                      color: Colors.deepOrange,
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    /* if(cubit.userModel!.tokenFcm == '')
                   Container(
                     color: Colors.yellowAccent,
                     height: 10,
                     width:  double.infinity,
                     child: Center(child: Text('Please update your profile to send your notiFication',style: GoogleFonts.aBeeZee(
                     color: Colors.blueAccent,
                     fontStyle: FontStyle.italic
                     ),),),
                   ),
                   */
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            navigateTo(context, UpdateProfile());
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
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
                          width: 30.0,
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
                          width: 30.0,
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
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            cubit.getDelayReports();
                            cubit.getDoneReports();
                            cubit.getInProgressReports();
                            cubit.getRufuseReports();
                            navigateTo(context, ReportLayOutScreen());
                          },
                          child: SizedBox(
                            height: 160,
                            width: 160,
                            child: Card(
                              color: Color(0xfffdf3f1),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 19),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Show Reports',
                                      style: GoogleFonts.montserrat(
                                          color: Color(0xff031B31),
                                          fontSize: 19),
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
                        ),
                        InkWell(
                          onTap: () {
                            navigateTo(context, SendReportScreen());
                          },
                          child: SizedBox(
                              height: 160,
                              width: 160,
                              child: Card(
                                color: Color(0xfffdf3f1),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 19),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Send Report',
                                        style: GoogleFonts.montserrat(
                                            color: Colors.black, fontSize: 19),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/send-svgrepo-com.svg',
                                        height: 70,
                                        width: 90,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InkWell(
                      onTap: () {
                        navigateTo(context, aboutscreen());
                      },
                      child: SizedBox(
                        height: 160,
                        width: 160,
                        child: Card(
                          color: Color(0xfffdf3f1),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 19),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Abouts Us',
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xff031B31), fontSize: 25),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SvgPicture.asset(
                                  'assets/images/about-svgrepo-com.svg',
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
