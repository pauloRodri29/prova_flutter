import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:prova_flutter/componentes/alerta.dart';
part 'login.g.dart';

class Login = _Login with _$Login;

abstract class _Login with Store {
  _Login() {
    autorun((_) {
      // print('campo $camposVazios');
      // print('senha $senhaValida');
      // print(isFormValid);
      // print('Usuario: $usuario');
      // print('Senha: $senha');
    });
  }

  @observable
  String usuario = '';

  @observable
  String senha = '';

  @observable
  bool carregando = false;

  @observable
  bool logado = false;

  @action
  void setUsuario(String textUser) => usuario = textUser;

  @action
  void setSenha(String textSenha) => senha = textSenha;

  @action
  void removendoEspaco() {
    usuario = usuario.trim();
    senha = senha.trim();
    // if (usuario.endsWith(' ') || senha.endsWith(' ')) {
    //   usuario = usuario.substring(0, usuario.length - 1);
    //   senha = senha.substring(0, senha.length - 1);
    // }
  }

  @action
  void mensagemTela(BuildContext context) {
    if (!camposVazios) {
      alerta(context, 'Campos Vazios');
    } else if (!senhaValida) {
      alerta(context, 'Senha Inválida');
    } else {
      alerta(context, 'Credenciais Inválidas');
    }
  }

  // @action
  // void limparCampos() {
  //   usuario = '';
  //   senha = '';
  // }

  @action
  Future<void> login() async {
    carregando = true;
    try {
      final response = await http.get(
        Uri.parse('https://6586e495468ef171392eee97.mockapi.io/user'),
      );

      // headers:
      // {
      //   HttpHeaders.authorizationHeader;
      //   'Basic $usuario:$senha';
      // }

      print('Response status: ${response.statusCode}');
      if (response.statusCode == 200) {
        final usuarios = jsonDecode(response.body) as List;
        print('Usuarios: $usuarios');
        for (final user in usuarios) {
          if (user['name'] == usuario && user['senha'] == senha) {
            logado = true;
            return;
          }
        }
      }
    } catch (e) {
      logado = false;
    } finally {
      await Future.delayed(const Duration(seconds: 2));
      carregando = false;
    }
  }

  @computed
  bool get camposVazios => usuario.isNotEmpty && senha.isNotEmpty;

  @computed
  bool get senhaValida =>
      senha.length >= 2 && RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senha);

  @computed
  bool get isFormValid => camposVazios && senhaValida;
}
