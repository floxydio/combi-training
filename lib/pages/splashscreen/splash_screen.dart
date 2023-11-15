// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:mockxl/helper/navigator.dart';
import 'package:mockxl/helper/shared_pref.dart';
import 'package:mockxl/pages/home/home_screen.dart';
import 'package:mockxl/pages/signin/sign_in_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void moveToHome() async {
    var res = await SharedPrefs.getToken("token");
    if (res.isEmpty) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SignInPage()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
  }

  @override
  initState() {
    super.initState();
    moveToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text("Loading")
        ],
      )),
    ));
  }
}
