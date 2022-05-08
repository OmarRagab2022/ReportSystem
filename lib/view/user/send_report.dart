import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SendReportScreen extends StatelessWidget {
  var formKeySendReport = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var messageController = TextEditingController();
  var ticketNameController = TextEditingController();
  var facultyNameController = TextEditingController();
  var ticketTimeController = TextEditingController();
  var ticketDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is SendReportGpImageSuccessState) {
          nameController.clear();
          phoneController.clear();
          messageController.clear();
          ticketDateController.clear();
          ticketTimeController.clear();
          ticketNameController.clear();
          UserCubit.get(context).removeImage();
          Navigator.pop(context);
        }
        if (state is SendReportGpImageErrorState) {
          Fluttertoast.showToast(msg: state.error);
        }
      },
      builder: (context, state) {
        var cubit = UserCubit.get(context).userModel;
        var cubitPir = UserCubit.get(context);
        // nameController.text = UserCubit.get(context).userModel!.name!;
        // phoneController.text = cubit!.phone!;
        // facultyNameController.text = cubit.facultyName!;
        return Scaffold(
          backgroundColor: Color(0xff031B31),
          appBar: AppBar(
            backgroundColor: Color(0xff031B31),
            elevation: 0.1,
            leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
            ),
            title: Text(
              'New Ropert',
              style: GoogleFonts.aBeeZee(color: Colors.white, fontSize: 19),
            ),
            centerTitle: true,
            actions: [
              TextButton(
                  onPressed: () {
                    cubitPir.sendReportToDb(
                        nameController.text,
                        phoneController.text,
                        messageController.text,
                        ticketNameController.text,
                        facultyNameController.text,
                        ticketTimeController.text,
                        ticketDateController.text);
                  },
                  child: Text(
                    'Send',
                    style:
                        GoogleFonts.aBeeZee(color: Colors.white, fontSize: 17),
                  ))
            ],
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    if (state is SendReportGpImageLoadingState)
                      LinearProgressIndicator(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //reportFeild(namefeild: 'Name', controller: nameController),
                        Card(
                          color: Colors.white,
                          child: DefaultFormField(
                            controller: nameController,
                            type: TextInputType.name,
                            label: 'Name',
                            prefix: Icons.account_box_sharp,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return ('Name must not be empty');
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /*reportFeild(
                            namefeild: 'Phone',
                            label: 'Phone',
                            controller: phoneController),*/
                        Card(
                          color: Colors.white,
                          child: DefaultFormField(
                            controller: phoneController,
                            type: TextInputType.number,
                            label: 'Phone',
                            prefix: Icons.phone,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return ('Phone must not be empty');
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /* reportFeild(
                            namefeild: 'facultyName',
                            controller: facultyNameController),*/
                        Card(
                          color: Colors.white,
                          child: DefaultFormField(
                            controller: facultyNameController,
                            type: TextInputType.name,
                            label: 'facultyName',
                            prefix: Icons.near_me_rounded,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return ('facultyName must not be empty');
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /* reportFeild(
                            namefeild: 'Ticket Name',
                            label: 'Ticket Name',
                            controller: ticketNameController),*/
                        Card(
                          color: Colors.white,
                          child: DefaultFormField(
                            controller: ticketNameController,
                            type: TextInputType.name,
                            label: 'Ticket Name',
                            prefix: Icons.report_problem,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return ('Email must not be empty');
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /*reportFeild(
                            namefeild: 'Message',
                            controller: messageController),*/
                        Card(
                          color: Colors.white,
                          child: DefaultFormField(
                            controller: messageController,
                            type: TextInputType.emailAddress,
                            label: 'Message',
                            prefix: Icons.message,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return ('Message must not be empty');
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /* Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Ticket Time',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),*/

                        Card(
                          color: Colors.white,
                          child: TextFormField(
                            controller: ticketTimeController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                labelText: 'Ticket Time',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.timelapse_sharp,
                                      color: Colors.deepOrange,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onTap: () {
                              showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now())
                                  .then((value) {
                                ticketTimeController.text =
                                    value!.format(context);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        /* Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            'Ticket Date',
                            style: GoogleFonts.aBeeZee(
                                fontSize: 19,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                        ),*/
                        //SizedBox(height: 20),
                        Card(
                          color: Colors.white,
                          child: TextFormField(
                            controller: ticketDateController,
                            keyboardType: TextInputType.datetime,
                            decoration: InputDecoration(
                                labelText: 'Ticket Date',
                                prefixIcon: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.calendar_today,
                                      color: Colors.deepOrange,
                                    )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            onTap: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2022-06-01'),
                              ).then((value) {
                                ticketDateController.text =
                                    DateFormat.yMMMd().format(value!);
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          // tileColor: Colors.white,
                          title: Text(
                            'Pirority :',
                            style: GoogleFonts.montserrat(
                                color: Colors.deepOrange, fontSize: 20),
                          ),

                          trailing: DropdownButton(
                            dropdownColor: Colors.white,
                            style: GoogleFonts.montserrat(
                                color: Colors.deepOrange,
                                // backgroundColor: Colors.black45,
                                fontSize: 20),
                            value: cubitPir.prioritySelected,
                            onChanged: (String? value) {
                              cubitPir.changePirority(value!);
                            },
                            items: cubitPir.dropDownMenuItems,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        defaultButton2(
                            function: () {
                              cubitPir.pickProfileImage(ImageSource.camera);
                            },
                            text: 'Upload Ticket Image'),
                        SizedBox(
                          height: 20,
                        ),
                        if (cubitPir.ticketImage != null)
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              if (cubitPir.ticketImage != null)
                                Container(
                                  height: 300,
                                  width: double.infinity,
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                            File(cubitPir.ticketImage!.path)),
                                      )),
                                ),
                              if (cubitPir.ticketImage != null)
                                IconButton(
                                    onPressed: () {
                                      cubitPir.removeImage();
                                    },
                                    icon: const CircleAvatar(
                                        backgroundColor: Colors.red,
                                        child: Icon(
                                          Icons.remove,
                                          color: Colors.white,
                                        ))),
                            ],
                          ),
                      ],
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }
}

Widget reportFeild({
  String? namefeild,
  final String? label,
  TextEditingController? controller,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            namefeild!,
            style: GoogleFonts.aBeeZee(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 9,
        ),
      ],
    );
