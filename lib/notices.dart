import 'package:flutter/material.dart';

class Notices extends StatefulWidget {
  @override
  NoticesState createState() => NoticesState();
}

class NoticesState extends State<Notices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bem-Vindo'),
        elevation: 0,
        backgroundColor: Colors.orange,
      ),

          body: ListView(
            children: <Widget>[
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Item 1'),
          ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Item 2'),
          ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Item 3'),
        ),
       ],
      ),
    );
  }
}