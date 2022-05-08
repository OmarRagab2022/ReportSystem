import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';

class ReportSuperAdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit, SuperAdminGPState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff031B31),
          appBar: AppBar(
            backgroundColor: Color(0xff031B31),
            elevation: 0.1,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: Text(
              SuperAdminGpCubit.get(context)
                  .titleScreen[SuperAdminGpCubit.get(context).currentIndex],
              style: GoogleFonts.aBeeZee(
                fontSize: 20,
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            centerTitle: true,
          ),
          body: SuperAdminGpCubit.get(context)
              .reportsScreen[SuperAdminGpCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: SuperAdminGpCubit.get(context).currentIndex,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.white,
            onTap: (index) {
              SuperAdminGpCubit.get(context).changeNavBarScreen(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.done),
                  label: 'Done',
                  backgroundColor: Color(0xff031B31)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.work), label: 'InProgress'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_box), label: 'Delay'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.error_outline), label: 'Refuese')
            ],
          ),
        );
      },
    );
  }
}
