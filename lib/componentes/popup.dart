import 'package:flutter/material.dart';
import 'package:prova_flutter/store/preenchercard.dart';

Future<void> confirmarExclusao(BuildContext context, String info) async {
  final PreencherCard store = PreencherCard();

  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Deseja Excluir?'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  store.deletarInformacao(info);
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

void editarInformacao(BuildContext context, String info) {
  // Implemente a lógica de edição aqui
}
