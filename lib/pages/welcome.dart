// ignore_for_file: prefer_const_constructors

import 'package:application_1/components/welcome_button.dart';
import 'package:application_1/pages/home_screen.dart';
import 'package:application_1/pages/register_page.dart';
import 'package:application_1/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ap = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
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
              MyButton(
                  text: "Get Started",
                  onPressed: () {
                    ap.isSignedIn == true //when true fetch shared prefrence data
                        ? Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                          )
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
