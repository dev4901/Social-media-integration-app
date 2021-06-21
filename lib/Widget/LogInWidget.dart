import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_5/Provider/google_sign_in.dart';

class LoggedInWidget extends StatelessWidget {
  const LoggedInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${user!.displayName}",
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: "Trueno",
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(user.photoURL!
                .replaceFirst('normal', '400x400')
                .replaceFirst("s96", "s500")),
            radius: 60.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Email - ",
                style: TextStyle(
                  fontFamily: "Trueno",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                user.email!,
                style: TextStyle(
                  fontFamily: "Trueno",
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 2.8,
              ),
              borderRadius: BorderRadius.circular(35.0),
            ),
            child: ElevatedButton(
              child: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.logout();
                FirebaseAuth.instance.signOut();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white30,
                shadowColor: Colors.transparent,
                elevation: 30.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
              ), //style
            ),
          ),
        ],
      ),
    );
  }
}
