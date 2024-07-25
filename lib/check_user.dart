import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'homepage.dart';

class CheckUser extends StatefulWidget {
  const CheckUser({super.key});

  @override
  State<CheckUser> createState() => _CheckUserState();
}

class _CheckUserState extends State<CheckUser> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isLogin(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          return snapshot.data as Widget;
        } else {
          return Scaffold(
            body: Center(
              child: Text('Error determining user state.'),
            ),
          );
        }
      },
    );
  }

  Future<Widget> isLogin() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return const Homepage();
    } else {
      return const LoginPage();
    }
  }
}
