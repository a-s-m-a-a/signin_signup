import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signin_signup/screens/home_screen.dart';
import 'package:signin_signup/screens/signin_or_signup_screen.dart';
import '../utils/color_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String keyLogin = "login";
  @override
  void initState() {
    super.initState();

    whereTOGo();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    decoration: BoxDecoration(
    gradient: LinearGradient(colors: [
    hexStringToColor("#2596be"),
    hexStringToColor("#bee0ec"),
    ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
    child: const Center(
      child: Icon(Icons.account_circle, color: Colors.white, size: 100,),
    ),
    )),
    );
  }


void whereTOGo() async{

    var sharedPref = await SharedPreferences.getInstance();
    var isLogIn = sharedPref.getBool(keyLogin);
  Future.delayed(const Duration(seconds: 5), (){
    if(isLogIn!=null){
      if(isLogIn){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else{
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SigninOrSignupPage()));
      }
    }else{
      Navigator.push(context, MaterialPageRoute(builder: (context) => const SigninOrSignupPage()));
    }
      });

}
}
