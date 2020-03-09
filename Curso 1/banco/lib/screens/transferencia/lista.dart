import 'package:banco/models/transferencia.dart';
import 'package:flutter/material.dart';

import 'formulario.dart';

class ListaTrasnferencias extends StatefulWidget {
	final List<Transferencia> _transferencia = List();
  
	@override
	State<StatefulWidget> createState() {
		return ListaTransferenciasState();
	}
}

class ListaTransferenciasState extends State<ListaTrasnferencias>{
  	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text("Transferências"),
			),
			body: ListView.builder(
				itemCount: widget._transferencia.length,
				itemBuilder: (context, indice) {
					final transferencia = widget._transferencia[indice];
					return IntemTransferencia(transferencia);
				},
			),
			floatingActionButton: FloatingActionButton(
				child: Icon(Icons.add), onPressed: () {
					Navigator.push(context, MaterialPageRoute(builder: (context) {
					return FormularioTransferencia();
				})).then((transferenciaRecebida) => _atualizar(transferenciaRecebida));
				},
			),
		);
	}

  void _atualizar(Transferencia transferenciaRecebida) {
  	  if (transferenciaRecebida != null) {
  	  	setState(() {
  	  	  widget._transferencia.add(transferenciaRecebida);
  	    });
  	  }
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