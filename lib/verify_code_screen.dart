import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashchatapp/homepage.dart';
import 'package:flashchatapp/ui_helper.dart';
import 'package:flutter/material.dart';
class VerifyCode extends StatefulWidget {
  final String verificationId;
  const VerifyCode({super.key , required this.verificationId});

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  TextEditingController digitCodeController = TextEditingController();
  UiHelper helper = UiHelper();
  bool loading = false;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Verify'),),
      body:  Column(
        children: [
          const SizedBox(height: 80,),

          helper.customText(digitCodeController, 'Enter 6 digit code', Icons.numbers, Colors.cyan, false,TextInputType.number),
          helper.customButton((){

            final credintial = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: digitCodeController.text.toString());

            try{
              auth.signInWithCredential(credintial);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Homepage()));

            }
            catch(e){
              helper.customDialogBox(context, e.toString());

            }
          }, 'Submit')




        ],),
    );
  }
}
