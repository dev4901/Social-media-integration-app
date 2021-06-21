import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:task_5/Provider/google_sign_in.dart';

class GoogleSignUpButtonWidget extends StatelessWidget {
  const GoogleSignUpButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black87,
          style: BorderStyle.solid,
          width: 2.8,
        ),
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          final provider =
              Provider.of<GoogleSignInProvider>(context, listen: false);
          provider.login();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white30,
          shadowColor: Colors.transparent,
          elevation: 30.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
          ),
        ),
        child: Container(
          width: 205,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/google_logo.png"),
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(width: 20),
              Text(
                "Google Sign in",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
