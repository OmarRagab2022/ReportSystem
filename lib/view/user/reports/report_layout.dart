import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';

class ReportLayOutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff031B31),
            elevation: 0.4,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios),
              color: Colors.white,
            ),
            title: Text(
              UserCubit.get(context)
                  .reportTitle[UserCubit.get(context).currentIndex],
              style: GoogleFonts.aBeeZee(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: UserCubit.get(context)
              .reportScreen[UserCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: UserCubit.get(context).currentIndex,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              UserCubit.get(context).changeNavBar(index);
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Color(0xff031B31),
                  icon: SvgPicture.asset(
                    'assets/images/done-all-svgrepo-com.svg',
                    color: Colors.white,
                    height: 25,
                    width: 25,
                  ),
                  label: 'Done'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      'assets/images/working-svgrepo-com.svg',
                      color: Colors.white,
                      height: 25,
                      width: 25),
                  label: 'InProgress'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/wait-svgrepo-com.svg',
                      color: Colors.white, height: 25, width: 25),
                  label: 'Delay'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset('assets/images/error-svgrepo-com.svg',
                      color: Colors.white, height: 25, width: 25),
                  label: 'Refuese')
            ],
          ),
        );
      },
    );
  }
}
