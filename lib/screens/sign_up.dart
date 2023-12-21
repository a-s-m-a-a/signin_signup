import 'dart:ui';

import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widgets.dart';
import '../utils/color_utils.dart';
import 'home_screen.dart';
import 'log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late double width = MediaQuery.of(context).size.width;
  late double height = MediaQuery.of(context).size.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/signin_or_signup_image.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Center(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 1.0,
                      sigmaY: 1.0,
                    ),
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(.4),
                      ),
                      child: const Column(
                        children: [
                          Image(image: AssetImage("assets/images/Logo/logo1.png"),height: 70,),
                          Text("Daily Recipe", style: TextStyle(fontFamily: "Lemongrass", fontSize: 50, color: Colors.white,),)
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,10,10,0),
                  child: Column(
                    children: [
                      const Text("Register",style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,), ),
                      reusableTextField(false, Icons.email, "Full Name"),
                      reusableTextField(false, Icons.email, "Email Address"),
                      reusableTextField(true, Icons.password, "Password"),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: reusableButton(width, 50, "Register", splashFunction(context,const HomePage(),true)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: richText(2, [
        "Already have an account? ",
        "Sign In"
      ], [
        Colors.white,
        hexStringToColor("#F45B00")
      ], [
            () {},
            () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const LogIn()));
        }
      ]),
    );
  }
}
