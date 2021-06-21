import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_5/Widget/TwitterSignUpButton.dart';
//import 'package:google_signin/Widget/google_signup_button_widget.dart';
import 'package:task_5/Widget/google_signup_button_widget.dart';

class SignUpWidget extends StatelessWidget {
  const SignUpWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => buildSignUp();

  Widget buildSignUp() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 325,
                width: 600,
                margin: EdgeInsets.fromLTRB(0, 60, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Container(
                      width: 300,
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "The",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 68,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Sparks",
                        style: TextStyle(
                          color: Colors.black87,
                          fontFamily: 'Trueno',
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 60,
                      alignment: Alignment.centerLeft,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Foundation",
                            style: TextStyle(
                              color: Colors.black87,
                              fontFamily: 'Trueno',
                              fontWeight: FontWeight.w900,
                              fontSize: 40,
                            ),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Container(
                            height: 60,
                            alignment: Alignment.bottomLeft,
                            child: Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF00AF19),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Spacer(),
          GoogleSignUpButtonWidget(),
          SizedBox(
            height: 18,
          ),
          TwitterSignUpButtonWidget(),
          SizedBox(
            height: 30.0,
          ),
          Text("Log in to continue"),
          Spacer(),
        ],
      );
}
