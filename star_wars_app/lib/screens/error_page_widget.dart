import 'package:flutter/material.dart';

class ErrorPageWidget extends StatelessWidget {
  final String errorMessage;

  ErrorPageWidget(this.errorMessage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.error, size: 150, color: Colors.red),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Desculpe, não foi possível carregar as informações.',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'O erro foi: $errorMessage',
            textAlign: TextAlign.center,
          ),
        )
        // TODO Colocar um botão de tentar novamente
      ],
    );
  }
}
