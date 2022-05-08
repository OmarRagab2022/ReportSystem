import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/Admin/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit, AdminState>(
      listener: (context, state) {
        if (state is UpdateProfileScreen) {
          AdminCubit.get(context).getDataProfileAdmin();
          Fluttertoast.showToast(msg: 'Update SuccessFully');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AdminCubit.get(context);
        var nameController = TextEditingController();
        var phoneController = TextEditingController();
        var emailController = TextEditingController();
        var passwordController = TextEditingController();
        var facultyController = TextEditingController();
        // nameController.text = cubit.userModel!.name!;
        //phoneController.text = cubit.userModel!.phone!;
        emailController.text = cubit.userModel!.email!;
        passwordController.text = cubit.userModel!.password!;

        /// facultyController.text = cubit.userModel!.facultyName!;
        return ConditionalBuilder(
          condition: cubit.userModel != null,
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
                'Update Profile',
                style: GoogleFonts.aBeeZee(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic),
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    cubit.updateProfile(nameController.text.trim(),
                        phoneController.text.trim());
                  },
                  child: Text(
                    'Update',
                    style: GoogleFonts.aBeeZee(
                        color: Colors.deepOrange,
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
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  //mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          CircleAvatar(
                            radius: 55,
                            backgroundImage: cubit.profileImageAdmin == null
                                ? NetworkImage(cubit.userModel!.imageProfile!)
                                : FileImage(cubit.profileImageAdmin!)
                                    as ImageProvider,
                          ),
                          IconButton(
                              onPressed: () {
                                cubit.pickProfileImage(ImageSource.gallery);
                              },
                              icon: const CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  )))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    profileItem(
                        nameItem: 'Name',
                        label: 'Name',
                        prefix: Icons.account_box_sharp,
                        controller: nameController),
                    const SizedBox(
                      height: 15,
                    ),
                    profileItem(
                        nameItem: 'Phone',
                        label: 'Phone',
                        prefix: Icons.phone,
                        controller: phoneController),
                    const SizedBox(
                      height: 15,
                    ),
                    profileItem(
                        label: 'Faculty Name',
                        nameItem: 'faculty',
                        prefix: Icons.account_balance_rounded,
                        controller: facultyController),
                    const SizedBox(
                      height: 70,
                    ),
                    Container(
                      width: 300,
                      child: defaultButton2(
                          function: () {}, text: 'Reset Password and Email'),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 300,
                      child: defaultButton2(
                        function: () {
                          cubit.singOutProfile(context);
                        },
                        text: 'Sign Out',
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

Widget profileItem(
        {String? nameItem,
        String? label,
        IconData? prefix,
        TextEditingController? controller}) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /*Text(
            nameItem!,
            style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),*/
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Card(
              color: Colors.white,
              child: DefaultFormField(
                controller: controller,
                type: TextInputType.text,
                prefix: prefix,
                label: label,
              ),
            ),
          )
        ],
      ),
    );
