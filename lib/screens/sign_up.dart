import 'package:flutter/material.dart';
import '../reusable_widgets/reusable_widgets.dart';
import '../utils/color_utils.dart';
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
                      "Create Your \nAccount!",
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
                  flex: 4,
                  child: Container(
                    alignment: AlignmentDirectional.topStart,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      children: [
                        reusableTextField(
                            false, Icons.person_outline, "Enter your username"),
                        reusableTextField(
                            false, Icons.email, "Enter your E-mail"),
                        reusableTextField(
                            true, Icons.password, "Enter password"),
                        reusableTextField(
                            true, Icons.password, "Confirm password"),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: reusableButton(width, 50, "SIGN UP", () {}),
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
      floatingActionButton: richText(2, [
        "Already have an account? ",
        "SIGN IN"
      ], [
        Colors.black87,
        Colors.black
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
