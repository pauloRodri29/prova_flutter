import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/componentes/label_site.dart';
import 'package:prova_flutter/cores/cores.dart';
import 'package:prova_flutter/store/login.dart';
import 'package:prova_flutter/tela_informacoes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //7878
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
          // decoration: BoxDecoration(gradient: CoresPersonalizadas().corFundo),
          color: Color.fromARGB(255, 63, 126, 134),
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
  final Login _storeLogin = Login();

  final TextEditingController _controllerUsuario = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();

  // @override
  // void dispose() {
  //   _controllerUsuario.dispose();
  //   _controllerSenha.dispose();
  //   super.dispose();
  // }

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
              maxLength: 20,
              controller: _controllerUsuario,
              onChanged: _storeLogin.setUsuario,
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
              controller: _controllerSenha,
              onChanged: _storeLogin.setSenha,
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
        Observer(builder: (_) {
          return TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Color.fromARGB(255, 32, 36, 33)),
                // backgroundColor:
                //     MaterialStateProperty.all(Color.fromARGB(255, 68, 189, 110)),
              ),
              onPressed: () {
                _storeLogin.removendoEspaco();
                _storeLogin.login();
                // if (_storeLogin.isFormValid) {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => const TelaInfor()));
                //   _controllerUsuario.clear();
                //   _controllerSenha.clear();
                // } else {
                //   _storeLogin.mensagemTela(context);
                // }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: _storeLogin.carregando
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1,
                      )
                    : const Text(
                        'ENTRAR',
                        style: TextStyle(color: Colors.white),
                      ),
              ));
        }),
        const SizedBox(
          height: 200,
        ),
        const PoliticasPrivacidade()
      ],
    );
  }
}
