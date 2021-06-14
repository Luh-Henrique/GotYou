import 'package:flutter/material.dart';
import 'package:flutter_app_gotyou/config.dart';
import 'package:flutter_app_gotyou/home.dart';
import 'package:flutter_app_gotyou/login.dart';
import 'package:flutter_app_gotyou/profile.dart';
import 'package:flutter_app_gotyou/request_page.dart';

void main()
{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      routes: {
        "/": (context) => Login(),
        "/Home": (context) => HomeScreen(),
        "/Profile": (context) => Profile(),
        "/Config": (context) => Config(),
        "/RequestPage": (context) => RequestPage(),
        "/About": (context) => HomeScreen()
    } ,
    );
  }
}