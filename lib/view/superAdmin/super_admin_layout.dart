import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/superAdmin/UsersAdmins/layout_screen.dart';
import 'package:gp/view/superAdmin/add_admin.dart';
import 'package:gp/view/superAdmin/add_user.dart';
import 'package:gp/view/superAdmin/chart_screen.dart';
import 'package:gp/view/superAdmin/profile.dart';
import 'package:gp/view/superAdmin/reports/reports_screen_layout.dart';

class SuperAdminLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit, SuperAdminGPState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SuperAdminGpCubit.get(context);

        return RefreshIndicator(
          onRefresh: () {
            return cubit.getProfileData();
          },
          child: ConditionalBuilder(
            condition: cubit.superAdmin != null,
            builder: (context) => Scaffold(
              backgroundColor: Color(0xff031B31),
              appBar: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xff031B31),
                  statusBarBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xff031B31),
                elevation: 0.1,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: IconButton(
                      onPressed: () {
                        navigateTo(context, ChartScreen());
                      },
                      icon: Image.asset(
                        'assets/images/icons8-chart-64.png',
                        height: 90,
                        width: 90,
                      ),
                    ),
                  )
                ],
                /*leading: InkWell(
                  onTap: () {
                    navigateTo(context, UpdateProfile());
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9.0),
                    child: CircleAvatar(
                      radius: 9.0,
                      backgroundImage:
                          NetworkImage(cubit.superAdmin!.imageProfile!),
                    ),
                  ),
                ),*/
                title: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Home',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                centerTitle: false,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
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
                                    cubit.superAdmin!.imageProfile!,
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
                            'Hi ' + cubit.superAdmin!.name!,
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
                        height: 50.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context, AddAdminScreen());
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
                                        'Add Admin',
                                        style: GoogleFonts.montserrat(
                                            color: Color(0xff031B31),
                                            fontSize: 19),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/administrator-svgrepo-com.svg',
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
                              navigateTo(context, AddUserScreen());
                            },
                            child: SizedBox(
                                height: 160,
                                width: 160,
                                child: Card(
                                  color: Color(0xfffdf3f1),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 19),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Add User',
                                          style: GoogleFonts.montserrat(
                                              color: Color(0xff031B31),
                                              fontSize: 19),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        SvgPicture.asset(
                                          'assets/images/user-svgrepo-com.svg',
                                          height: 70,
                                          width: 70,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              navigateTo(context, ReportSuperAdminScreen());
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
                                        'Reports',
                                        style: GoogleFonts.montserrat(
                                            color: Color(0xff031B31),
                                            fontSize: 25),
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
                          InkWell(
                            onTap: () {
                              navigateTo(context, LayOutScreen());
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
                                        'Show all Users',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                          color: Color(0xff031B31),
                                          fontSize: 22,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SvgPicture.asset(
                                        'assets/images/user-groups-svgrepo-com.svg',
                                        height: 50,
                                        width: 50,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            fallback: (context) => RefreshIndicator(
                onRefresh: () {
                  return cubit.getProfileData();
                },
                child: Center(child: CircularProgressIndicator())),
          ),
        );
      },
    );
  }
}
