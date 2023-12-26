import 'package:prova_flutter/models/chave_infor.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServicosSharedPrefencies {
  static SharedPreferences? _shPref;

  Future<List<ChaveInfor>> carregarInformacaoShared() async {
    try {
      _shPref ??= await SharedPreferences.getInstance();
      Set<String>? chaves = _shPref?.getKeys();
      List<ChaveInfor> dados = [];
      if (chaves != null) {
        for (String chave in chaves) {
          String valor = _shPref!.getString(chave)!;
          dados.add(ChaveInfor(chave, valor));
        }
        // } else {
        //   print('Não existem chaves');
      }

      return dados;
    } on Exception catch (e) {
      throw Exception('Erro ao carregar informações: $e');
    }
  }

  Future<void> salvarInformacao(String chave, String informacao) async {
    try {
      _shPref ??= await SharedPreferences.getInstance();
      await _shPref?.setString(chave, informacao);
      // print('Salvando $chave e $informacao');
    } on Exception catch (e) {
      throw Exception('Erro ao salvar informação: $e');
    }
  }

  Future<void> deletarInformacao(String chave) async {
    try {
      _shPref ??= await SharedPreferences.getInstance();
      _shPref!.remove(chave);
      // print('Deletando $chave com sucesso');
    } on Exception catch (e) {
      throw Exception('Erro ao deletar informação: $e');
    }
  }

  Future<void> editarInformacaoShared(String chave, String infor) async {
    try {
      _shPref ??= await SharedPreferences.getInstance();
      _shPref!.setString(chave, infor);
    } on Exception catch (e) {
      throw Exception('Erro ao editar informação: $e');
    }
  }
}
