import 'package:flutter/material.dart';
import 'package:prova_flutter/componentes/label_site.dart';
import 'package:prova_flutter/cores/cores.dart';

class TelaInfor extends StatelessWidget {
  const TelaInfor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: CoresPersonalizadas().corFundo),
        child: const Padding(
          padding: EdgeInsets.all(40),
          child: CapturaInfor(),
        ),
      ),
    );
  }
}

class CapturaInfor extends StatefulWidget {
  const CapturaInfor({super.key});

  @override
  State<CapturaInfor> createState() => _CapturaInforState();
}

class _CapturaInforState extends State<CapturaInfor> {
  void alertaConfirm(String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error: '),
          content: Text(mensagem),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.close),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SingleChildScrollView(
            child: Card(
          child: Column(
            children: [
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Digite seu Texto',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Digite seu Texto',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Digite seu Texto',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Digite seu Texto',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none),
                ),
              ),
              TextField(
                textAlign: TextAlign.center,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  hintText: 'Digite seu Texto',
                  hintStyle: TextStyle(color: Colors.black),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      borderSide: BorderSide.none),
                ),
              ),
            ],
          ),
        )),
        SizedBox(height: 40),
        TextField(
          textAlign: TextAlign.center,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Digite seu Texto',
            hintStyle: TextStyle(color: Colors.black),
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide.none),
          ),
        ),
        SizedBox(height: 200),
        PoliticasPrivacidade()
      ],
    );
  }
}
