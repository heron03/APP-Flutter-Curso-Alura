import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  final String mensagem;

  Progress({this.mensagem = 'Loading'});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Visibility(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(mensagem, style: TextStyle(fontSize: 16.0)),
            ),
            visible:  false,
          ),
        ],
      ),
    );
  }
}
