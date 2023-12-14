import 'package:flutter/material.dart';
import 'package:signin_signup/reusable_widgets/reusable_widgets.dart';
import 'package:signin_signup/screens/log_in.dart';
import 'package:signin_signup/screens/sign_up.dart';

import '../utils/color_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("#2596be"),
              hexStringToColor("#bee0ec"),
            ], begin: Alignment.centerRight, end: Alignment.centerLeft),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: [
                const Text(
                  "Welcome Back",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 42),
                ),
                reusableButton(width, 50, "SIGN IN", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LogIn()));
                }),
                reusableButton(width, 50, "SIGN UP", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
