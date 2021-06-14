import 'package:flutter/material.dart';

class Home extends StatelessWidget {
 String texto = 'deu merda';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}

