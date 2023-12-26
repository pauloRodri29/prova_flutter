import 'package:flutter/material.dart';

Future<void> confirmarExclusao(BuildContext context, String chave, final store) async {

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Deseja Excluir?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  print('chave $chave');
                  store.deletarInformacao(chave);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Sim',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Não', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ],
      );
    },
  );
}