import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
    print(carregando);
    await Future.delayed(const Duration(seconds: 1));
    carregando = false;
  }

  @computed
  bool get camposVazios => usuario.isNotEmpty && senha.isNotEmpty;

  @computed
  bool get senhaValida =>
      senha.length >= 2 && RegExp(r'^[a-zA-Z0-9]+$').hasMatch(senha);

  @computed
  bool get isFormValid => camposVazios && senhaValida;
}
