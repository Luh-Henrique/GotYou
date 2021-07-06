import 'package:flutter/material.dart';
import 'package:flutter_app_gotyou/config.dart';
import 'package:flutter_app_gotyou/home.dart';
import 'package:flutter_app_gotyou/profile.dart';
import 'package:flutter_app_gotyou/request_page.dart';
import 'package:flutter_app_gotyou/login.dart';
import 'package:flutter_app_gotyou/register.dart';

void main()
{
  runApp(MyApp());
}

final routes = {
  "/": (BuildContext context) => Login(),
  '/Login': (BuildContext context) => Login(),
  '/Register': (BuildContext context) => Register(),
  "/Home": (BuildContext context) => HomeScreen(),
  "/Profile": (BuildContext context) => Profile(),
  "/Config": (BuildContext context) => Config(),
  "/RequestPage": (BuildContext context) => RequestPage(),
  "/About": (BuildContext context) => HomeScreen()
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.orange),
      routes: routes,
    );
  }
}