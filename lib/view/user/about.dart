// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/User/cubit.dart';
import 'package:gp/controller/User/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/user/reports/delay.dart';
import 'package:gp/view/user/reports/report_layout.dart';
import 'package:gp/view/user/send_report.dart';
import 'package:gp/view/user/update_profile.dart';

class aboutscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff031B31),
      appBar: AppBar(
        backgroundColor: Color(0xff031B31),
        elevation: 0.0,
        /*leading: InkWell(
                onTap: () {
                  cubit.getProfileData();
                  navigateTo(context, UpdateProfile());
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundImage:
                        NetworkImage(cubit.userModel!.imageProfile!),
                  ),
                ),
              ), */
        title: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'About Us ',
            style: GoogleFonts.aBeeZee(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.message,
                color: Colors.deepOrange,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        'https://scontent.fcai22-2.fna.fbcdn.net/v/t1.6435-9/78848000_10157981503191941_4198420236526944256_n.jpg?_nc_cat=104&ccb=1-5&_nc_sid=174925&_nc_ohc=Xh5FtmDD8hoAX-uil0j&_nc_ht=scontent.fcai22-2.fna&oh=00_AT9d23_qqRFOGew207uiUFrOyfHM5dYbIpGfgzo56cxjvw&oe=6213E9CD',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Dr Mona Nasr',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Head of Information Systems Dept., Faculty of Computers & Artificial Intelligence, Helwan University And The owner of system you can send an email if you want any thing about Tickiting system',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      letterSpacing: 1.2,
                      wordSpacing: 1.5,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        'https://www.connect4techs.com/wp-content/uploads/2020/10/%D8%AA%D9%83%D8%AA%D9%8A%D9%86%D8%AC-%D8%B3%D9%8A%D8%B3%D8%AA%D9%85.jpg',
                      ), /*NetworkImage(
                        'assets/images/LOGO3.png',*/
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Ticketing System',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Head of Information Systems Dept., Faculty of Computers & Artificial Intelligence, Helwan University And The owner of system you can send an email if you want any thing about Tickiting system',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      letterSpacing: 1.2,
                      wordSpacing: 1.5,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                        'https://yt3.ggpht.com/ytc/AKedOLT4KWkAiEn0wL68erWKtHDn4Dhl7elCxHjT3IP5=s900-c-k-c0x00ffffff-no-rj',
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Computer Science',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Head of Information Systems Dept., Faculty of Computers & Artificial Intelligence, Helwan University And The owner of system you can send an email if you want any thing about Tickiting system',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      letterSpacing: 1.2,
                      wordSpacing: 1.5,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          'https://thumbs.dreamstime.com/b/solving-problem-25077628.jpg'),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'The Ticket',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Head of Information Systems Dept., Faculty of Computers & Artificial Intelligence, Helwan University And The owner of system you can send an email if you want any thing about Tickiting system',
                  style: GoogleFonts.aBeeZee(
                      fontSize: 15,
                      letterSpacing: 1.2,
                      wordSpacing: 1.5,
                      fontWeight: FontWeight.w300,
                      color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
