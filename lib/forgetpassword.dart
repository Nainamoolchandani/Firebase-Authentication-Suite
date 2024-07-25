import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchatapp/ui_helper.dart';
import 'package:flutter/material.dart';
import 'ui_helper.dart';
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {





  TextEditingController emailcontroller = TextEditingController();
  forgetPassword(String email)async{
    if(email == ''){
      return helper.customDialogBox(context, 'Text Field empty');
    }
    else{
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);

    }

  }
  UiHelper helper = UiHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Password Reset screen'),),
      body: Column(
        children: [
          helper.customText(
          emailcontroller, 'Email', Icons.email, Colors.cyan, false,TextInputType.emailAddress),

          helper.customButton((){
            forgetPassword(emailcontroller.text.toString());

          }, 'ResetPassword')



        ],
      ),
    );
  }
}
