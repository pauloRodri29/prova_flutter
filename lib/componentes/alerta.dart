import 'package:flutter/material.dart';

void alerta(BuildContext context, String mensagem) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: const Color.fromARGB(255, 134, 35, 28),
      content: Text(
        mensagem,
        style: const TextStyle(color: Colors.white),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Fechar',
        textColor: Colors.white,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
