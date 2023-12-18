import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/splash_screen.dart';

Container reusableTextField(
    bool isPasswordType, IconData icon, String lableText) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        obscureText: isPasswordType,
        enableSuggestions: isPasswordType,
        autocorrect: isPasswordType,
        cursorColor: Colors.black,
        keyboardType: isPasswordType
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.purple,
          ),
          labelText: lableText,
          labelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          filled: false,
          floatingLabelBehavior: FloatingLabelBehavior.never,
        ),
      ),
    ),
  );
}

Container reusableButton(
    double width, double height, String text, Function onTap) {
  return Container(
    width: width,
    height: height,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(90.0),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white;
          }
          return Colors.blue;
        }),
        foregroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.black;
          }
          return Colors.white;
        }),
        side: const MaterialStatePropertyAll(BorderSide(
          width: 1.0,
          color: Colors.white,
        )),
        elevation: const MaterialStatePropertyAll(0),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 25),
      ),
    ),
  );
}

RichText richText(
    int num, List<String> text, List<Color> colors, List<Function> function) {
  return RichText(
      text: TextSpan(children: <TextSpan>[
    for (int i = 0; i < num; i++)
      TextSpan(
          text: text[i],
          style: TextStyle(
            color: colors[i],
            fontSize: 18,
            fontStyle: FontStyle.italic,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = function[i] as GestureTapCallback?),
  ]));
}

Function functionButton(var context, Widget pushToPage, bool isLogIn)  {
  fun ()async{
    var sharedPref = await SharedPreferences.getInstance();
    sharedPref.setBool(SplashScreenState.keyLogin, isLogIn);
    Navigator.push(context, MaterialPageRoute(builder: (context) => pushToPage));
  }
 return fun;
}
