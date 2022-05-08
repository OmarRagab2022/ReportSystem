import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:image_picker/image_picker.dart';

class AddAdminScreen extends StatelessWidget {
  var sacffoldKey = GlobalKey<ScaffoldState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passowrdController = TextEditingController();
  var facultyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit, SuperAdminGPState>(
      listener: (context, state) {
        if (state is CreateAdminGpSuccesState) {
          nameController.clear();
          phoneController.clear();
          emailController.clear();
          passowrdController.clear();
          facultyController.clear();
          SuperAdminGpCubit.get(context).proFileAdminImage = null;
          Fluttertoast.showToast(msg: 'Add SuccessFully');
          Navigator.pop(context);
        }
        if (state is CreateAdminGpErrorState) {
          Fluttertoast.showToast(msg: state.error);
        }
      },
      builder: (context, state) {
        var cubit = SuperAdminGpCubit.get(context);
        return Scaffold(
          backgroundColor: Color(0xff031B31),
          key: sacffoldKey,
          appBar: AppBar(
            backgroundColor: Color(0xff031B31),
            elevation: 0.1,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            title: Text(
              'Add Admin',
              style: GoogleFonts.montserrat(color: Colors.white, fontSize: 19),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    if (cubit.proFileAdminImage != null) {
                      cubit.createAdminProfile(
                          name: nameController.text.trim(),
                          email: emailController.text.trim(),
                          password: passowrdController.text.trim(),
                          phone: phoneController.text.trim(),
                          facultyName: facultyController.text.trim());
                    } else {
                      Fluttertoast.showToast(msg: 'Please choose Enter Photo');
                    }
                  },
                  child: Text(
                    'create',
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 17),
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children: [
                        CircleAvatar(
                          radius: 69,
                          backgroundImage: cubit.proFileAdminImage == null
                              ? NetworkImage(
                                  'https://thumbs.dreamstime.com/b/default-avatar-profile-flat-icon-social-media-user-vector-portrait-unknown-human-image-default-avatar-profile-flat-icon-184330869.jpg')
                              : FileImage(cubit.proFileAdminImage!)
                                  as ImageProvider,
                        ),
                        IconButton(
                            onPressed: () {
                              sacffoldKey.currentState!
                                  .showBottomSheet((context) => Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20)),
                                            color: Colors.grey[300]),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Choose your Source Image ...',
                                                style: GoogleFonts.aBeeZee(
                                                    color: Colors.black,
                                                    fontStyle:
                                                        FontStyle.italic),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        cubit
                                                            .pickProFileAdminImage(
                                                                ImageSource
                                                                    .gallery);
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.image)),
                                                  IconButton(
                                                      onPressed: () {
                                                        cubit
                                                            .pickProFileAdminImage(
                                                                ImageSource
                                                                    .camera);
                                                        Navigator.pop(context);
                                                      },
                                                      icon: const Icon(
                                                          Icons.camera))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ));
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
                    height: 30,
                  ),
                  Form(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Name ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16)),
                            Card(
                              color: Colors.white,
                              child: SizedBox(
                                height: 40,
                                width: 230,
                                child: DefaultFormField(
                                    controller: nameController,
                                    type: TextInputType.text),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Phone ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 16)),
                            Card(
                              child: SizedBox(
                                height: 40,
                                width: 230,
                                child: DefaultFormField(
                                    controller: phoneController,
                                    type: TextInputType.text),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Email ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 16)),
                            Card(
                              child: SizedBox(
                                height: 40,
                                width: 230,
                                child: DefaultFormField(
                                    controller: emailController,
                                    type: TextInputType.text),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('faculty ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 16)),
                            Card(
                              child: SizedBox(
                                height: 40,
                                width: 230,
                                child: DefaultFormField(
                                    controller: facultyController,
                                    type: TextInputType.text),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Password ',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 16)),
                            Card(
                              child: SizedBox(
                                height: 40,
                                width: 230,
                                child: DefaultFormField(
                                    controller: passowrdController,
                                    type: TextInputType.text),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
