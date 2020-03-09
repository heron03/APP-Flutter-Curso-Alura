import 'package:flutter/material.dart';

void main() => runApp(Banco());

class Banco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		home: Scaffold(
			body: ListaTrasnferencias(),
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
	    body: ListView(
		  children: <Widget>[
			  Editor(controlador: _controladorCampoNumeroConta, rotulo: 'Número da Conta', dica: '0000'),
			  Editor(controlador: _controladorCampoValor, rotulo: 'Valor', dica: '0.00', icon: Icons.monetization_on),
			  
			  RaisedButton(
				  child: Text('Confirmar'), onPressed: () => _criaTransferencia(context),
        ),
		  ],
	  ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int numeroConta = int.tryParse(_controladorCampoValor.text);
    final double valor = double.tryParse(_controladorCampoNumeroConta.text);
    if (numeroConta != null && valor != null) {
    	final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData icon;

  Editor({this.controlador, this.rotulo, this.dica, this.icon});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
			    padding: const EdgeInsets.all(16.0),
			    child: TextField(
					controller:	controlador,
				  	style: TextStyle(
					  fontSize: 24.0
				  ),
				  decoration: InputDecoration(
            icon: icon != null ? Icon(icon) : null,
					  labelText: rotulo,
					  hintText: dica,
				  ),
				  keyboardType: TextInputType.number,
			    ),
			  );
  }

}

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
        final Future<Transferencia> future = Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FormularioTransferencia();
      }));
      future.then((transferenciaRecebida) {
          widget._transferencia.add(transferenciaRecebida);
        });
      },
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