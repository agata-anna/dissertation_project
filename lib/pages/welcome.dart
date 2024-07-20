// ignore_for_file: prefer_const_constructors

import 'package:application_1/components/welcome_button.dart';
import 'package:application_1/pages/register_page.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //place holder for image
              Icon(Icons.square),
              SizedBox(height: 20),
              Text("Aim"),
              SizedBox(height: 20),
              MyButton(text: "Get Started", onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              }),
            ],
          ),
        ),
        ),
    );
  }
}