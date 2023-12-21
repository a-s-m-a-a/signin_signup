import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:signin_signup/reusable_widgets/reusable_widgets.dart';
import 'package:signin_signup/screens/home_screen.dart';
import 'package:signin_signup/screens/sign_up.dart';
import '../utils/color_utils.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
                      child: Column(
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
                      Text("Sign In",style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,), ),
                      reusableTextField(
                          false, Icons.email, "Email Address"),
                      reusableTextField(
                          true, Icons.password, "Password"),
                      richText(
                          1, ["Forget Password?"], [hexStringToColor("#12819D")], [() {}]),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: reusableButton(width, 50, "Sign In", splashFunction(context,const HomePage(),true)),
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
        "Don't have an account? ",
        "Register"
      ], [
        Colors.white,
        hexStringToColor("#F45B00")
      ], [
        () {},
        () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignUp()));
        }
      ]),
    );
  }
}
