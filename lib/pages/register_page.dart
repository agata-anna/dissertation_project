// ignore_for_file: prefer_const_constructors

import 'package:application_1/components/welcome_button.dart';
import 'package:application_1/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "44", 
    countryCode: "GB", 
    e164Sc: 0, 
    geographic: true, 
    level: 1, 
    name: "United Kingdome", 
    example: "United Kingdome", 
    displayName: "United kingdome", 
    displayNameNoCountryCode: "GB", 
    e164Key: ""
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //place holder for image
              Icon(Icons.square),
              SizedBox(height: 20),
              Text(
                "To ensure the safety of our community, please verify your number.",
                textAlign: TextAlign.center,
                ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  cursorColor: Colors.pink,
                  controller: phoneController,
                  decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.pink),
                    ),
                    prefixIcon: Container(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: (){
                          showCountryPicker(
                            context: context, 
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 500,
                            ),
                            onSelect: (value) {
                            setState(() {
                              selectedCountry = value;
                            });
                          });
                        },
                        child: Text("${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MyButton(text: "Send Code", onPressed: () => sendPhoneNumber()),
            ],
          ),
        ),
        ),
    );
  }

  void sendPhoneNumber(){
    //+441234567891
    final ap = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim(); //removing white space from spaces
    ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  }
}