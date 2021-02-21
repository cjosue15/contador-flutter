import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() => new _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  TextStyle estiloTexto = new TextStyle(fontSize: 25);
  Color mainColor = Color(0xFF3CAEA3);
  int contador = 00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: mainColor,
        title: Text('App bar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Número de clicks:',
              style: estiloTexto,
            ),
            Text(
              '$contador',
              style: estiloTexto,
            ),
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _crearBotones() {
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      SizedBox(width: 20),
      FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.close),
        onPressed: _operaciones(operacion: 'resetear'),
      ),
      Spacer(),
      FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.add),
        onPressed: _operaciones(operacion: 'sumar'),
      ),
      SizedBox(width: 20),
      FloatingActionButton(
        backgroundColor: mainColor,
        child: Icon(Icons.remove),
        onPressed: _operaciones(operacion: 'restar'),
      ),
      SizedBox(width: 20),
    ]);
  }

  Function _operaciones({operacion: String}) {
    return () => {
          setState(() {
            if (operacion == 'sumar') {
              contador = contador + 1;
            } else if (operacion == 'restar') {
              if (contador > 0) {
                contador = contador - 1;
              }
            } else {
              contador = 0;
            }
          })
        };
  }
}
