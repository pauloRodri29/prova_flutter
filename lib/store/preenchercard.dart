import 'package:mobx/mobx.dart';
import 'package:prova_flutter/models/chave_infor.dart';
import 'package:prova_flutter/servicos/chaves_shared.dart';

part 'preenchercard.g.dart';

class PreencherCard = _PreencherCard with _$PreencherCard;

abstract class _PreencherCard with Store {
  _PreencherCard() {
    carregarInformacao();
    autorun((_) {
      // print("cvPego $cvPego");
      // print("chave ${cvPego?.chave}");
      // print("valor ${cvPego?.infor}");
      // print('Tamanho ${informacoes.length}');
      // print('Conteúdo ${informacoes.map((e) => e.chave)}');
      // print('Conteúdo ${informacoes.map((e) => e.infor)}');
      // print('informações $informacoes');
      // print(informacao);
      // print(edit);
    });
  }
  @observable
  bool edit = false;

  @observable
  String informacao = '';

  // @observable
  // String chavePega = '';

  // @observable
  // String valorPega = '';

  @observable
  ChaveInfor? cvPego;

  @observable
  ObservableList<ChaveInfor> informacoes = ObservableList<ChaveInfor>();

  @action
  void botaoEditClicado() => edit = true;

  @action
  void setInformacao(String texto) => informacao = texto;

  @action
  void setCVPego(String textoChave, String textoValor) {
    if (cvPego == null) {
      cvPego = ChaveInfor(textoChave, textoValor);
    } else {
      cvPego!.chave = textoChave;
      cvPego!.infor = textoValor;
    }
  }

  // @action
  // void setChave(String textoChave) => informacao = textoChave;

  // @action
  // void setValor(String textoValor) => informacao = textoValor;

  @action
  Future<void> carregarInformacao() async {
    final dados = await ServicosSharedPrefencies().carregarInformacaoShared();
    if (dados.isNotEmpty) {
      for (var infor in dados) {
        informacoes.add(ChaveInfor(infor.chave, infor.infor));
      }
    }
  }

  @action
  void salvarInformacao() {
    String chave = DateTime.now().millisecondsSinceEpoch.toString();
    informacoes.add(ChaveInfor(chave, informacao));
    ServicosSharedPrefencies().salvarInformacao(chave, informacao);
    informacao = '';
  }

  @action
  void deletarInformacao(String chave) {
    ServicosSharedPrefencies().deletarInformacao(chave);
    informacoes.removeWhere((chaveInfor) => chaveInfor.chave == chave);
  }

  @action
  void editarInformacao() {
    print(cvPego?.infor);
    if (cvPego != null) {
      for (var chaveInfor in informacoes) {
        if (cvPego!.chave == chaveInfor.chave) {
          chaveInfor.infor = informacao;
          cvPego!.infor = informacao;

          // print('chaveInfor teste ${chaveInfor.infor}');
          // print('cvPego teste ${cvPego!.infor}');
          ServicosSharedPrefencies()
              .editarInformacaoShared(chaveInfor.chave, chaveInfor.infor);
          edit = false;
          cvPego = null;
          informacoes.replaceRange(informacoes.indexOf(chaveInfor),
              informacoes.indexOf(chaveInfor) + 1, [chaveInfor]);

          // informacoes.clear();
          // carregarInformacao();
          return;
        }
      }
    }
  }

  @computed
  bool get isEdit => edit;
}
