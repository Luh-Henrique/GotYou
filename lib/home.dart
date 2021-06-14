import 'package:flutter/material.dart';
import 'package:flutter_app_gotyou/request_page.dart';
import 'package:flutter_app_gotyou/config.dart';
import 'package:flutter_app_gotyou/login.dart';
import 'package:flutter_app_gotyou/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  var _telas = [
    Profile(),
    Config(),
    Profile(),
    RequestPage()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GOT YOU - DELIVERY'),),
      body: IndexedStack(
        children: <Widget>[
          Profile(),
          Config(),
          Profile(),
          RequestPage()
        ],
        index:_indiceAtual,
      ),

      /* body: PageView(
        children: _telas,
        onPageChanged: (index){
          setState(() {
            _indiceAtual = index;
          });
        }
        ,)
      , */
      bottomNavigationBar:new Theme(
    data: Theme.of(context).copyWith(
    // sets the background color of the `BottomNavigationBar`
    canvasColor: Colors.orange,
    // sets the active color of the `BottomNavigationBar` if `Brightness` is light
    primaryColor: Colors.orange[500],
    textTheme: Theme
        .of(context)
        .textTheme
        .copyWith(caption: new TextStyle(color: Colors.yellow))), // sets the inactive color of the `BottomNavigationBar`
    child: new BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _indiceAtual = index;
          });
        },

        currentIndex: _indiceAtual,

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Início'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Config.'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Perfil')
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.where_to_vote),
            title: Text('Requisições'),
          ),
        ],
      ),
        ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}