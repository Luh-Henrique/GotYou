import 'package:flutter/material.dart';
import 'package:flutter_app_gotyou/about.dart';

class Config extends StatefulWidget {
  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {

    @override
    Widget build(BuildContext context) {

      return Scaffold(
          appBar: AppBar(
            title: Text("Configurações"),
          ),
          body: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.workspaces_filled),
                title: Text('Daltonismo'),
              ),
              ListTile(
                leading: Icon(Icons.photo_album),
                title: Text('Opção 2'),
              ),
              ListTile(
                leading: Icon(Icons.apartment),
                title: Text('Sobre o app'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => About()),
                  );
                },
              ),
            ],
          )
      );
    }
}