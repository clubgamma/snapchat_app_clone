import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:snapchat_clone_main/MainPage/home_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(seconds: 3),
            () async {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: const Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/snapchat_logo.jpeg"),
        )
      ),
    );
  }
}
