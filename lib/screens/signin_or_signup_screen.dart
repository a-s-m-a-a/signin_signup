import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:signin_signup/reusable_widgets/reusable_widgets.dart';
import 'package:signin_signup/screens/log_in.dart';
import 'package:signin_signup/screens/sign_up.dart';

import '../utils/color_utils.dart';

class SigninOrSignupPage extends StatefulWidget {
  const SigninOrSignupPage({super.key});

  @override
  State<SigninOrSignupPage> createState() => _SigninOrSignupPageState();
}

class _SigninOrSignupPageState extends State<SigninOrSignupPage> {
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
          child: Column(
            children: [
              Expanded(flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(.4),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                          image: AssetImage("assets/images/Logo/logo1.png"),
                          height: 70,
                        ),
                        Text(
                          "Daily Recipe",
                          style: TextStyle(
                            fontFamily: "Lemongrass",
                            fontSize: 40,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const Text(
                "cooking done the easy way",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              Expanded(flex:3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    reusableButton(width, 60, "Register", () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const SignUp()));
                  }),
                    reusableButton(width, 60, "Sign In", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => const LogIn()));
                    }),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
