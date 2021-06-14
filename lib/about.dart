import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  AboutState createState() => AboutState();
}

class AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sobre os devs'),
        ),
        body: Center(
          child: Text('Se esta aqui quer saber da gente (｡>﹏<｡)'),
        ),
      ),
    );
  }
}