import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';

class LayOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit, SuperAdminGPState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SuperAdminGpCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xff031B31),
          appBar: AppBar(
            backgroundColor: Color(0xff031B31),
            elevation: 0,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: GoogleFonts.aBeeZee(fontSize: 17, color: Colors.white),
            ),
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff031B31),
            elevation: 0.0,
            currentIndex: cubit.currentIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              cubit.changeNavBarScreen(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/images/user-svgrepo-com.svg',
                    color: Colors.white,
                    height: 15,
                    width: 15,
                  ),
                  label: 'Users'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/images/system-administrator-sysadmin-svgrepo-com.svg',
                      color: Colors.white,
                      height: 15,
                      width: 15),
                  label: 'Admin'),
            ],
          ),
        );
      },
    );
  }
}
