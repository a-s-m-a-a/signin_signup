import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup/reusable_widgets/reusable_widgets.dart';
import 'package:signin_signup/screens/signin_or_signup_screen.dart';
import 'package:signin_signup/screens/splash_screen.dart';
import '../utils/color_utils.dart';
import 'log_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              var sharedPref = await SharedPreferences.getInstance();
              sharedPref.setBool(SplashScreenState.keyLogin, false);
              Navigator.push(context, MaterialPageRoute(builder: (context) => SigninOrSignupPage()));

            },
          )
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              hexStringToColor("#2596be"),
              hexStringToColor("#bee0ec"),
            ], begin: Alignment.centerRight, end: Alignment.centerLeft),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: const Center(
              child: Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 100,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
