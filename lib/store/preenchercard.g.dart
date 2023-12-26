// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preenchercard.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PreencherCard on _PreencherCard, Store {
  Computed<bool>? _$isEditComputed;

  @override
  bool get isEdit => (_$isEditComputed ??=
          Computed<bool>(() => super.isEdit, name: '_PreencherCard.isEdit'))
      .value;

  late final _$editAtom = Atom(name: '_PreencherCard.edit', context: context);

  @override
  bool get edit {
    _$editAtom.reportRead();
    return super.edit;
  }

  @override
  set edit(bool value) {
    _$editAtom.reportWrite(value, super.edit, () {
      super.edit = value;
    });
  }

  late final _$informacaoAtom =
      Atom(name: '_PreencherCard.informacao', context: context);

  @override
  String get informacao {
    _$informacaoAtom.reportRead();
    return super.informacao;
  }

  @override
  set informacao(String value) {
    _$informacaoAtom.reportWrite(value, super.informacao, () {
      super.informacao = value;
    });
  }

  late final _$cvPegoAtom =
      Atom(name: '_PreencherCard.cvPego', context: context);

  @override
  ChaveInfor? get cvPego {
    _$cvPegoAtom.reportRead();
    return super.cvPego;
  }

  @override
  set cvPego(ChaveInfor? value) {
    _$cvPegoAtom.reportWrite(value, super.cvPego, () {
      super.cvPego = value;
    });
  }

  late final _$informacoesAtom =
      Atom(name: '_PreencherCard.informacoes', context: context);

  @override
  ObservableList<ChaveInfor> get informacoes {
    _$informacoesAtom.reportRead();
    return super.informacoes;
  }

  @override
  set informacoes(ObservableList<ChaveInfor> value) {
    _$informacoesAtom.reportWrite(value, super.informacoes, () {
      super.informacoes = value;
    });
  }

  late final _$carregarInformacaoAsyncAction =
      AsyncAction('_PreencherCard.carregarInformacao', context: context);

  @override
  Future<void> carregarInformacao() {
    return _$carregarInformacaoAsyncAction
        .run(() => super.carregarInformacao());
  }

  late final _$_PreencherCardActionController =
      ActionController(name: '_PreencherCard', context: context);

  @override
  void botaoEditClicado() {
    final _$actionInfo = _$_PreencherCardActionController.startAction(
        name: '_PreencherCard.botaoEditClicado');
    try {
      return super.botaoEditClicado();
    } finally {
      _$_PreencherCardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInformacao(String texto) {
    final _$actionInfo = _$_PreencherCardActionController.startAction(
        name: '_PreencherCard.setInformacao');
    try {
      return super.setInformacao(texto);
    } finally {
      _$_PreencherCardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCVPego(String textoChave, String textoValor) {
    final _$actionInfo = _$_PreencherCardActionController.startAction(
        name: '_PreencherCard.setCVPego');
    try {
      return super.setCVPego(textoChave, textoValor);
    } finally {
      _$_PreencherCardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void salvarInformacao() {
    final _$actionInfo = _$_PreencherCardActionController.startAction(
        name: '_PreencherCard.salvarInformacao');
    try {
      return super.salvarInformacao();
    } finally {
      _$_PreencherCardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deletarInformacao(String chave) {
    final _$actionInfo = _$_PreencherCardActionController.startAction(
        name: '_PreencherCard.deletarInformacao');
    try {
      return super.deletarInformacao(chave);
    } finally {
      _$_PreencherCardActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editarInformacao() {
    final _$actionInfo = _$_PreencherCardActionController.startAction(
        name: '_PreencherCard.editarInformacao');
    try {
      return super.editarInformacao();
    } finally {
      _$_PreencherCardActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
edit: ${edit},
informacao: ${informacao},
cvPego: ${cvPego},
informacoes: ${informacoes},
isEdit: ${isEdit}
    ''';
  }
}
