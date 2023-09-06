import 'dart:async';

import 'package:flutter/material.dart';
import 'package:health_flutter_app/constants.dart';
import 'package:health_flutter_app/view/screens/auth/login_screen.dart';
import 'package:health_flutter_app/view/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2), () {
      var currentUser = firebaseAuth.currentUser;
      if (currentUser == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
        // } else if (currentUser.emailVerified == false) {
        //   Navigator.pushReplacement(
        //       context, MaterialPageRoute(builder: (context) => VerifyEmail()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFF35185a),
          child: Center(
            child: Image.asset('assets/images/logo.png'),
          )),
    );
  }
}
