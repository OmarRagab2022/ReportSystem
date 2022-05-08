import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gp/controller/superadmin/cubit.dart';
import 'package:gp/controller/superadmin/states.dart';
import 'package:gp/theme/constraints.dart';

class ResetEmailAndPassword extends StatelessWidget {
  var emailController  = TextEditingController();
   
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SuperAdminGpCubit,SuperAdminGPState>(
      listener: (context,state){},
      builder: (context,state){
        emailController.text = SuperAdminGpCubit.get(context).superAdmin!.email!;
        return  Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios,color: Colors.black,),
            ),
            title: Text('Reset Email and Password',style: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontSize: 19
            ),),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19,vertical: 90),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 if(state is UpdateProfileSuperAdminLoadingState)
                   LinearProgressIndicator(), 
                DefaultFormField(
                  controller: emailController,
                  type: TextInputType.text,
                ),
                const SizedBox(height: 50,),
                defaultButton(function: (){
                  if(emailController.text !=null)
                  {
                    SuperAdminGpCubit.get(context).resetEmailAndPassword(emailController.text.trim(), context); 
                  }else{
                    Fluttertoast.showToast(msg: 'No Email here');
                  }
                }, text: 'Reset')
              ],
            ),
          ),
        );
       
      },
    );
  }
}