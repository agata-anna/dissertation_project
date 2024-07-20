// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:application_1/components/login_textfield.dart';
import 'package:application_1/components/sign_in_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //this will be logo for now icon in place
              Icon(
                Icons.square,
                size: 100,
              ),
              const SizedBox(height: 50),
              Text(
                "Welcome back!",
                style: TextStyle(color: Colors.deepPurple, fontSize: 16),
              ),
              LoginTextField(
                controller: userNameController,
                hintText: "User Name",
                obscureText: false,
                ),
              LoginTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?"), 
                    ],
                  ),
                ),
                SignInButton(onTap: signUserIn,),
            ],
          ),
        ),
      ),
    );
  }
}
