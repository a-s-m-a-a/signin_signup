import 'package:flutter/material.dart';
import 'package:signin_signup/reusable_widgets/reusable_widgets.dart';
import 'package:signin_signup/screens/sign_up.dart';

import '../utils/color_utils.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
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
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: ListTile(
                    title: Text(
                      "Hello\nSign In!",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 42,
                      ),
                    ),
                    trailing: Icon(Icons.menu_outlined),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        reusableTextField( false, Icons.person_outline, "Enter your username"),
                        reusableTextField( true, Icons.password, "Enter your password"),
                        richText(1, ["Forget Password?"], [Colors.black], [(){}] ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: reusableButton(width, 50, "SIGN IN", (){}),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: richText(2, ["Don't have an account? ", "SIGN UP"], [Colors.grey, Colors.black],[(){},(){Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));}]),
    );
  }
}
