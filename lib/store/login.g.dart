// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Login on _Login, Store {
  Computed<bool>? _$camposVaziosComputed;

  @override
  bool get camposVazios => (_$camposVaziosComputed ??=
          Computed<bool>(() => super.camposVazios, name: '_Login.camposVazios'))
      .value;
  Computed<bool>? _$senhaValidaComputed;

  @override
  bool get senhaValida => (_$senhaValidaComputed ??=
          Computed<bool>(() => super.senhaValida, name: '_Login.senhaValida'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid => (_$isFormValidComputed ??=
          Computed<bool>(() => super.isFormValid, name: '_Login.isFormValid'))
      .value;

  late final _$usuarioAtom = Atom(name: '_Login.usuario', context: context);

  @override
  String get usuario {
    _$usuarioAtom.reportRead();
    return super.usuario;
  }

  @override
  set usuario(String value) {
    _$usuarioAtom.reportWrite(value, super.usuario, () {
      super.usuario = value;
    });
  }

  late final _$senhaAtom = Atom(name: '_Login.senha', context: context);

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  late final _$carregandoAtom =
      Atom(name: '_Login.carregando', context: context);

  @override
  bool get carregando {
    _$carregandoAtom.reportRead();
    return super.carregando;
  }

  @override
  set carregando(bool value) {
    _$carregandoAtom.reportWrite(value, super.carregando, () {
      super.carregando = value;
    });
  }

  late final _$loginAsyncAction = AsyncAction('_Login.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$_LoginActionController =
      ActionController(name: '_Login', context: context);

  @override
  void setUsuario(String textUser) {
    final _$actionInfo =
        _$_LoginActionController.startAction(name: '_Login.setUsuario');
    try {
      return super.setUsuario(textUser);
    } finally {
      _$_LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String textSenha) {
    final _$actionInfo =
        _$_LoginActionController.startAction(name: '_Login.setSenha');
    try {
      return super.setSenha(textSenha);
    } finally {
      _$_LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removendoEspaco() {
    final _$actionInfo =
        _$_LoginActionController.startAction(name: '_Login.removendoEspaco');
    try {
      return super.removendoEspaco();
    } finally {
      _$_LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  void mensagemTela(BuildContext context) {
    final _$actionInfo =
        _$_LoginActionController.startAction(name: '_Login.mensagemTela');
    try {
      return super.mensagemTela(context);
    } finally {
      _$_LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
usuario: ${usuario},
senha: ${senha},
carregando: ${carregando},
camposVazios: ${camposVazios},
senhaValida: ${senhaValida},
isFormValid: ${isFormValid}
    ''';
  }
}
