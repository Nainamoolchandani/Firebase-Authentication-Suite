import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page')

      ),
      body:   Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text('Welcome ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,color: Colors.deepPurple),)
             Image.asset('assets/welcome.png')
          ],
        ),
      ),
    );
  }
}
