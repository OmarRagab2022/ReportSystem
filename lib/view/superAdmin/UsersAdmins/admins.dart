import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/model/user_model.dart';

class AdminsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit, SuperAdminGPState>(
      listener: (context, state) {
        if (state is RemoveAnyUserSuccessState) {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Remove Admin successFully');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xff031B31),
          body: ConditionalBuilder(
            condition: SuperAdminGpCubit.get(context).admins.length > 0,
            builder: (context) => Padding(
              padding: const EdgeInsets.all(5),
              child: ListView.separated(
                  itemBuilder: (context, index) => userWidger(
                      SuperAdminGpCubit.get(context).admins[index], context),
                  separatorBuilder: (context, index) => const Divider(
                        height: 1.5,
                        color: Colors.black,
                      ),
                  itemCount: SuperAdminGpCubit.get(context).admins.length),
            ),
            fallback: (context) => isEmpty(),
          ),
        );
      },
    );
  }
}

Widget userWidger(UserModel? user, context) => Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user!.imageProfile!),
            ),
            const SizedBox(
              width: 9,
            ),
            Text(
              user.name!,
              style: GoogleFonts.aBeeZee(fontSize: 15, color: Colors.black),
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  SuperAdminGpCubit.get(context).removeAnyUser(user.uId!);
                },
                icon: const Icon(Icons.delete))
          ],
        ),
      ),
    );

Widget isEmpty() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 120),
      child: Center(
        child: Column(
          children: const [
            Icon(
              Icons.person,
              color: Colors.grey,
              size: 30,
            ),
            Text(
              'No Users Here',
              style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
