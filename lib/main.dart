import 'package:flutter/material.dart';
import 'package:prova_flutter/componentes/label_site.dart';
import 'package:prova_flutter/cores/cores.dart';
import 'package:prova_flutter/tela_informacoes.dart';

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
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: CoresPersonalizadas().corFundo),
          child: const Padding(
            padding: EdgeInsets.all(40),
            child: Acesso(),
          ),
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
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool validarCampos(String senha, String usuario) {
    if (usuario.isEmpty || senha.isEmpty) {
      alerta("Por favor, preencha ambos os campos de Usuário e Senha.");
      return false;
    }
    if (senha.length < 2) {
      alerta("A Senha deve ter pelo menos dois caracteres.");
      return false;
    }
    if (usuario.endsWith(' ') || senha.endsWith(' ')) {
      usuario.substring(0, usuario.length - 1);
      senha.substring(0, senha.length - 1);
      return true;
    }
    if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senha)) {
      alerta(
          "A Senha não pode ter caracteres especiai, isso inclui 'espaços'.");
      return false;
    }
    // if (usuario.length > 20 || senha.length > 20) {
    //   alerta("Os campos não podem ter mais de 20 caracteres.");
    // }

    return true;
  }

  void alerta(String mensagem) {
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

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Usuário',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w100,
                fontSize: 18,
              ),
            ),
            TextField(
              controller: usuarioController,
              maxLength: 20,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Senha',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w100,
                    fontSize: 18)),
            TextField(
              controller: senhaController,
              maxLength: 20,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                counterText: '',
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
            onPressed: () {
              if (validarCampos(senhaController.text, usuarioController.text)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const TelaInfor()),
                );
              }
            },
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
        const PoliticasPrivacidade()
      ],
    );
  }
}
