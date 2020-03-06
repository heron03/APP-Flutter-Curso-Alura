import 'package:flutter/material.dart';

void main() => runApp(
	Column(
		children: <Widget>[
			Text('Ola', textDirection: TextDirection.ltr,),
			Text('Mundo', textDirection: TextDirection.ltr,),
			Expanded(
			child: FittedBox(
				fit: BoxFit.contain, // otherwise the logo will be tiny
				child: const FlutterLogo(),
			),
			),
		],
	) 
);
