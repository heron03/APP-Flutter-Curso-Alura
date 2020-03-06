import 'package:flutter/material.dart';

void main() => runApp(Banco());

class Banco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		home: Scaffold(
			body: FormularioTransferencia(),
		),
	);
  }
}

class FormularioTransferencia extends StatelessWidget {
  
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Transferência'),
      ),
	  body: Column(
		  children: <Widget>[
			  Padding(
			    padding: const EdgeInsets.all(16.0),
			    child: TextField(
					controller:	_controladorCampoNumeroConta,
				  	style: TextStyle(
					  fontSize: 24.0
				  ),
				  decoration: InputDecoration(
					  labelText: 'Número da Conta',
					  hintText: '0000',
				  ),
				  keyboardType: TextInputType.number,
			    ),
			  ),
			  Padding(
			    padding: const EdgeInsets.all(16.0),
			    child: TextField(
					controller:	_controladorCampoValor,
				  	style: TextStyle(
					  fontSize: 24.0
				  	),
				  decoration: InputDecoration(
					  icon: Icon(Icons.monetization_on),
					  labelText: 'Valor',
					  hintText: '0000',
				  ),
				  keyboardType: TextInputType.number,
			    ),
			  ),
			  RaisedButton(
				  child: Text('Confirmar'), onPressed: () {
					final int numeroConta = int.tryParse(_controladorCampoValor.text);
					final double valor = double.tryParse(_controladorCampoNumeroConta.text);
					if (numeroConta != null && valor != null) {
						Transferencia(valor, numeroConta);
					}
				  },
			  ),
		  ],
	  ),
    );
  }
}


class ListaTrasnferencias extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
    
	return Scaffold(
		appBar: AppBar(
			title: Text("Transferências"),
		),
		body: Column(
			children: <Widget>[
				IntemTransferencia(Transferencia(100.00, 10000)),
				IntemTransferencia(Transferencia(200.00, 20000)),
				IntemTransferencia(Transferencia(400.00, 40000)),
				IntemTransferencia(Transferencia(500.00, 50000)),
			],
		),
		floatingActionButton: FloatingActionButton(
			child: Icon(Icons.add), onPressed: () {},
		),
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