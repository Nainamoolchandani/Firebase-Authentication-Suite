import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homepage.dart';
import 'ui_helper.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UiHelper helper = UiHelper();

  signUp(String email, String password) async {
    if (email.isEmpty && password.isEmpty) {
      helper.customDialogBox(context, 'Enter Required Fields');
    } else {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((onValue) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Homepage()));
        });
      } on FirebaseAuthException catch (ex) {
        helper.customDialogBox(context, ex.code.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp Page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          helper.customText(
              emailController, 'Email', Icons.email, Colors.deepPurple, false,TextInputType.emailAddress),
          helper.customText(passwordController, 'Password', Icons.password,
              Colors.deepPurple, true,TextInputType.text),
          const SizedBox(height: 10),
          helper.customButton(() {
            signUp(emailController.text.toString(),
                passwordController.text.toString());
          }, 'Sign Up'),
        ],
      ),
    );
  }
}
