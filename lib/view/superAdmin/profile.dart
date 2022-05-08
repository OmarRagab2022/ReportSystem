import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/superAdmin/reset_email_password.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatelessWidget {
  var sacffoldProfileKey = GlobalKey<ScaffoldState>();
  var formKeyProfile = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit, SuperAdminGPState>(
      listener: (context, state) {
        if (state is UpdateProfileSuperAdminSuccessState) {
          Navigator.pop(context);
          Fluttertoast.showToast(msg: 'Update Success');
        }
      },
      builder: (context, state) {
        var cubit = SuperAdminGpCubit.get(context);
        //nameController.text = cubit.superAdmin!.name!;
        //phoneController.text = cubit.superAdmin!.phone!;

        return ConditionalBuilder(
          condition: cubit.superAdmin != null,
          builder: (context) => Scaffold(
            backgroundColor: Color(0xff031B31),
            key: sacffoldProfileKey,
            appBar: AppBar(
              backgroundColor: Color(0xff031B31),
              elevation: 0.0,
              leading: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Edit Profile',
                style: GoogleFonts.montserrat(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    cubit.updateProfile(
                        nameController.text, phoneController.text);
                  },
                  child: Text(
                    'Update',
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 19,
                    ),
                  ),
                )
              ],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(19.0),
                child: Form(
                  key: formKeyProfile,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is UpdateProfileSuperAdminLoadingState)
                        LinearProgressIndicator(),
                      Center(
                        child: Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 55,
                              backgroundImage: cubit.proFileAdminImage == null
                                  ? NetworkImage(
                                      cubit.superAdmin!.imageProfile!)
                                  : FileImage(cubit.proFileUserImage!)
                                      as ImageProvider,
                            ),
                            IconButton(
                                onPressed: () {
                                  cubit.pickProfileUserImage(
                                      ImageSource.gallery);
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
                      const SizedBox(
                        height: 20,
                      ),
                      widgetFormField(
                          controllerName: nameController,
                          feildName: 'Name',
                          validateMessage: 'Please enter your name',
                          widgetType: TextInputType.text),
                      const SizedBox(
                        height: 10,
                      ),
                      widgetFormField(
                          controllerName: phoneController,
                          feildName: 'Phone',
                          validateMessage: 'Please Enter your phone',
                          widgetType: TextInputType.phone),
                      const SizedBox(
                        height: 10,
                      ),
                      widgetFormField(
                          controllerName: null,
                          feildName: 'Faculty Name',
                          validateMessage: 'Please enter your name',
                          widgetType: TextInputType.text),
                      const SizedBox(
                        height: 55,
                      ),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: defaultButton2(
                            function: () =>
                                navigateTo(context, ResetEmailAndPassword()),
                            text: 'Reset email and password'),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: defaultButton2(
                            function: () {
                              cubit.singOutProfile(context);
                            },
                            text: 'Log Out'),
                      )
                    ],
                  ),
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

Widget widgetFormField(
        {String? feildName,
        TextEditingController? controllerName,
        String? validateMessage,
        TextInputType? widgetType}) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${feildName} : ',
          style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 20),
        ),
        const SizedBox(
          width: 2,
        ),
        SizedBox(
          height: 50,
          width: 330,
          child: Card(
            color: Colors.white,
            child: DefaultFormField(
                controller: controllerName,
                type: widgetType,
                validate: (String value) {
                  if (value.isEmpty) {
                    return validateMessage;
                  }
                  return null;
                }),
          ),
        )
      ],
    );
