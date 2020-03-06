import 'package:flutter/material.dart';

void main() => runApp(
	MaterialApp(
		home: Scaffold(
			body: ListaTrasnferencias(),
			appBar: AppBar(title: Text("Transferências"),),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add), onPressed: () {},
			),
		),
	),
);


class ListaTrasnferencias extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
    
	return Column(
		children: <Widget>[
			IntemTransferencia(Transferencia(100.00, 10000)),
			IntemTransferencia(Transferencia(200.00, 20000)),
			IntemTransferencia(Transferencia(400.00, 40000)),
			IntemTransferencia(Transferencia(500.00, 50000)),
		],
	);
	}
}

class IntemTransferencia extends StatelessWidget {
    final Transferencia _transferencia;

	IntemTransferencia(this._transferencia);
	
	@override
	Widget build(BuildContext context) {

	return Card(
		child: ListTile(
			leading: Icon(Icons.monetization_on),
			title: Text(_transferencia.valor.toString()),
			subtitle: (Text(_transferencia.numeroConta.toString())),
		),
	);
	}
}

class Transferencia {
	final double valor;
	final int numeroConta;

	Transferencia(this.valor, this.numeroConta);
}