
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/Admin/cubit.dart';
import 'package:gp/controller/Admin/states.dart';
import 'package:gp/theme/constraints.dart';
import 'package:gp/view/auth/login.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminCubit,AdminState>(
      listener: (context, state) {
        if(state is ResetEmailAndPasswordAdminGpSuccessState){
          navigateAndFinish(context, LoginScreen());
        }
      },
      builder: (context, state) {
        var cubit =AdminCubit.get(context);
        var nameController = TextEditingController();
        var phoneController = TextEditingController();
        var emailController = TextEditingController();
        var passwordController = TextEditingController();
        var facultyController = TextEditingController();
        nameController.text = cubit.userModel!.name!;
        phoneController.text= cubit.userModel!.phone!;
        emailController.text =cubit.userModel!.email!;
        passwordController.text = cubit.userModel!.password!;
        facultyController.text= cubit.userModel!.facultyName!;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.1,
            leading: IconButton(onPressed: ()=>Navigator.pop(context),icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),),
            title: Text('Reset Password and Email',style: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic
            ),),
            actions: [
              MaterialButton(onPressed: (){},child:Text('Reset',style: GoogleFonts.aBeeZee(
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic
            ),) ,)
            ],
          ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 profileItem(nameItem: 'Email',controller: emailController),
                 const SizedBox(height: 20,),
                 profileItem(nameItem: 'Password',controller: passwordController),
                 const SizedBox( height: 20,),
                 defaultButton(function: (){}, text: 'Reset Password and Email'),
                 
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget profileItem({
  String ?nameItem,
  TextEditingController ?controller
})=> Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(nameItem!,style: GoogleFonts.aBeeZee(
                              color: Colors.blue,
                             fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.italic
            ),),
            const SizedBox(height: 15,),
            SizedBox(
              width: double.infinity,
              child: DefaultFormField(
                controller: controller,
                type : TextInputType.text
              ),
            ) 
                    ],
                  );