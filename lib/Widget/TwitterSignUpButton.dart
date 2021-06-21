//
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_twitter/flutter_twitter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/*void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'FlutterBase',
        theme: ThemeData(brightness: Brightness.light),
        home: TwitterSignUpButton());
  }
} */

class TwitterSignUpButtonWidget extends StatefulWidget {
  const TwitterSignUpButtonWidget({Key? key}) : super(key: key);

  @override
  _TwitterSignUpButtonWidgetState createState() =>
      _TwitterSignUpButtonWidgetState();
}

class _TwitterSignUpButtonWidgetState extends State<TwitterSignUpButtonWidget> {
  @override
  Widget build(BuildContext context) {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User? Curuser = _auth.currentUser;
    String? email;
    String? name;
    final tlogin = TwitterLogin(
      consumerKey: "DXQufRrYAGiXuScbX3ovoerSi",
      consumerSecret: "33ECP5gpMUAQyC2SQgiuRCRD7f0TolBLUezUL5O5tVtMbvBtfc",
    );
    void _signInWithTwitter(String token, String secret) async {
      final AuthCredential credential = TwitterAuthProvider.credential(
        accessToken: token,
        secret: secret,
      );
      final info = await _auth.signInWithCredential(credential);
      print(
          "\n\n\nin _signinwithtwitter metthod ${info.user!.displayName}\n ${info.user!.email}\n\n");
      setState(() {
        email = info.user!.email;
        name = info.user!.displayName;
      });
    }

    String _message = ' ';

    Future _twitterlogging() async {
      final result = await tlogin.authorize();
      String newMessage = '';
      switch (result.status) {
        case TwitterLoginStatus.loggedIn:
          print("loggin in started");
          newMessage = "successful login by - ${result.session.username}";
          print("\n\nsuccessful login by - ${result.session.username}\n\n");
          _signInWithTwitter(result.session.token, result.session.secret);
          final user = _auth.currentUser!;
          print("\n\nsuccessful login by - ${user.displayName}\n\n");
          newMessage = "\n\nsuccessful login by - ${user.displayName}\n\n";
          break;
        case TwitterLoginStatus.cancelledByUser:
          newMessage = "Login Cancelled by user";
          print("Login Cancelled by user");
          break;
        case TwitterLoginStatus.error:
          newMessage = "Error is - ${result.errorMessage}";
          print("Error is - ${result.errorMessage}");
          break;
        default:
      }

      setState(() {
        _message = newMessage;
      });
    }

    void _logout() async {
      //print("\n\n${_auth.currentUser!.displayName} is signing out\n\n");
      await tlogin.logOut();
      await _auth.signOut();
      setState(() {
        _message = "Logout";
      });
    }

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
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.lightBlue,
                size: 30.0,
              ),
              SizedBox(width: 20),
              Text(
                "Google Sign in",
                style: TextStyle(fontSize: 20, color: Colors.black87),
              ),
            ],
          ),
        ),
        onPressed: () {
          setState(() {
            _twitterlogging();
          });
        },
      ),
    );
  }
}

//
//
/*import 'package:flutter/material.dart';
import 'package:twitter_login/twitter_login.dart';
//import 'package:twitter_login_example/env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                child: Text('login'),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                  minimumSize: MaterialStateProperty.all<Size>(Size(160, 48)),
                ),
                onPressed: () async {
                  await login();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future login() async {
    final twitterLogin = TwitterLogin(
      /// Consumer API keys
      apiKey: "DXQufRrYAGiXuScbX3ovoerSi",

      /// Consumer API Secret keys
      apiSecretKey: "33ECP5gpMUAQyC2SQgiuRCRD7f0TolBLUezUL5O5tVtMbvBtfc",

      /// Registered Callback URLs in TwitterApp
      /// Android is a deeplink
      /// iOS is a URLScheme
      redirectURI: 'task://',
    );

    /// Forces the user to enter their credentials
    /// to ensure the correct users account is authorized.
    /// If you want to implement Twitter account switching, set [force_login] to true
    /// login(forceLogin: true);
    final authResult = await twitterLogin.login(forceLogin: false);
    switch (authResult.status) {
      case TwitterLoginStatus.loggedIn:
        // success
        print(
            '====== Login success ======\n User is ${authResult.user!.name}\n\n');
        break;
      case TwitterLoginStatus.cancelledByUser:
        // cancel
        print('====== Login cancel ======');
        break;
      case TwitterLoginStatus.error:
      case null:
        // error
        print('====== Login error ======');
        break;
    }
  }
}*/
