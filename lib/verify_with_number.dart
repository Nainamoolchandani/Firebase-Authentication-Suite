import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchatapp/ui_helper.dart';
import 'package:flashchatapp/verify_code_screen.dart';
import 'package:flashchatapp/verify_code_screen.dart';
import 'package:flutter/material.dart';
class VerifyWithNumber extends StatefulWidget {
  const VerifyWithNumber({super.key});

  @override
  State<VerifyWithNumber> createState() => _VerifyWithNumberState();
}

class _VerifyWithNumberState extends State<VerifyWithNumber> {
 TextEditingController numberController = TextEditingController();
  UiHelper helper = UiHelper();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Login'),),
      body:  Column(
        children: [
          const SizedBox(height: 80,),

        helper.customText(numberController, '92-12345678', Icons.numbers, Colors.cyan, false,TextInputType.number),
        helper.customButton((){
          auth.verifyPhoneNumber(
            phoneNumber: numberController.text.toString(),

              verificationCompleted: (_){

              },
              verificationFailed: (e){
              helper.customDialogBox(context, e.code.toString());
              },
              codeSent: (String verificationId, int? token){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyCode(verificationId:verificationId)));

              },
              codeAutoRetrievalTimeout: (e){
                helper.customDialogBox(context, e.toString());
              },);


        }, 'Submit')




      ],),
    );
  }
}
