import 'package:flashchatapp/forgetpassword.dart';
import 'package:flashchatapp/verify_with_number.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bouncing_spinner/bouncing_spinner.dart';
import 'homepage.dart';
import 'signup.dart';
import 'ui_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  UiHelper helper = UiHelper();

  login(String email, String password) async {
    if (email.isEmpty && password.isEmpty) {
      helper.customDialogBox(context, 'Required field empty');
    } else {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password)
            .then((onValue) {
          Navigator.pushReplacement(context,
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
        title: const Text('Login Page'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 80,),
            helper.customText(
                emailController, 'Email', Icons.email, Colors.cyan, false,TextInputType.emailAddress),
            helper.customText(passwordController, 'Password', Icons.password,
                Colors.cyan, true,TextInputType.text),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  "forget password",
                  style: TextStyle(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgotPassword()));
                    },
                    child: const Text(
                      'Forgot password',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    )),

              ],
            ),
            const SizedBox(height: 10,),
            helper.customButton(() {
              login(emailController.text.toString(),
                  passwordController.text.toString());
            }, 'LOGIN'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't Have An Account?",
                  style: TextStyle(),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),

    TextButton(onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>VerifyWithNumber()));
    }, child: const Text('Verify with number', style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold),))

        ]
        ),
      ),
    );
  }
}