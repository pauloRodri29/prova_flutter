import 'package:mobx/mobx.dart';
import 'package:prova_flutter/servicos/chaves_shared.dart';

part 'preenchercard.g.dart';

class PreencherCard = _PreencherCard with _$PreencherCard;

abstract class _PreencherCard with Store {
  @observable
  String informacao = '';

  @observable
  ObservableList<String> informacoes = ObservableList<String>();

  @action
  void setInformacao(String texto) => informacao = texto;

  @action
  Future<void> carregarInformacao() async {
    final dados = await ServicosSharedPrefencies().carregarInformacao();
    informacoes.addAll(dados.values);
  }

  @action
  void salvarInformacao() {
    if (informacao.isNotEmpty) {
      ServicosSharedPrefencies().savarInformacao(informacao);
      informacoes.add(informacao);
      informacao = '';
    }
  }

  @action
  void deletarInformacao(String chave) {
    informacoes.remove(chave);
    ServicosSharedPrefencies().deletarInformacao(chave);
  }

  @action
  void editarInformacao(String infoAntiga, String infoNova) {
    informacoes[informacoes.indexOf(infoAntiga)] = infoNova;
    ServicosSharedPrefencies().editarInformacao(infoAntiga, infoNova);
  }
}