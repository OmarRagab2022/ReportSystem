import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/Admin/states.dart';

class WorkingReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AdminCubit.get(context);
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
              cubit.titleWorking[cubit.currentWokring],
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
            centerTitle: true,
          ),
          body: cubit.working[cubit.currentWokring],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Color(0xff031B31),
            currentIndex: cubit.currentWokring,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.deepOrange,
            onTap: (index) {
              cubit.changeNavBarWorking(index);
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Color(0xff031B31),
                  icon: SvgPicture.asset(
                    'asssets/images/wait-svgrepo-com.svg',
                    height: 30,
                    width: 30,
                  ),
                  label: 'Delay'),
              BottomNavigationBarItem(
                  backgroundColor: Color(0xff031B31),
                  icon: SvgPicture.asset(
                    'asssets/images/working-svgrepo-com.svg',
                    height: 40,
                    width: 40,
                  ),
                  label: 'InProgress')
            ],
          ),
        );
      },
    );
  }
}
