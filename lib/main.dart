import 'package:flutter/material.dart';
import 'package:prova_flutter/componentes/label_site.dart';
import 'package:prova_flutter/cores/cores.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}

class TelaLogin extends StatelessWidget {
  const TelaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: CoresPersonalizadas().corFundo),
        child: const Padding(
          padding: EdgeInsets.all(40),
          child: Acesso(),
        ),
      ),
    );
  }
}

class Acesso extends StatefulWidget {
  const Acesso({super.key});

  @override
  State<Acesso> createState() => _AcessoState();
}

class _AcessoState extends State<Acesso> {
  final Uri url = Uri(scheme: 'https', host: 'www.google.com');
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Usuário',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Senha',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 18)),
            TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.lock),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    borderSide: BorderSide.none),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 75, 170, 108)),
            ),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                'ENTRAR',
                style: TextStyle(color: Colors.white),
              ),
            )),
        const SizedBox(
          height: 200,
        ),
        PoliticasPrivacidade(url: url)
      ],
    );
  }
}
