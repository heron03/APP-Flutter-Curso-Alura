import 'package:flutter/material.dart';

void main() => runApp(
	MaterialApp(
		home: Scaffold(
			body: Column(
				children: <Widget>[
					Card(
						child: ListTile(
							leading: Icon(Icons.monetization_on),
							title: Text('100.00'),
							subtitle: (Text("1000")),
						),
					),
					Card(
						child: ListTile(
							leading: Icon(Icons.monetization_on),
							title: Text('200.00'),
							subtitle: (Text("1100")),
						),
					),
				],
			),
			appBar: AppBar(title: Text("Transferências"),),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add), onPressed: () {},
			),
		),
	),
);
