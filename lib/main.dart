import 'package:flutter/material.dart';
import 'package:snapchat_clone_main/SplashScreen/splash_screen.dart';
import 'MainPage/home_page.dart';

void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      home: SplashScreen(),
    );
  }
}
