import 'package:shared_preferences/shared_preferences.dart';

class ServicosSharedPrefencies {
  SharedPreferences? _shPref;

  Future<Map<String, String>> carregarInformacao() async {
    _shPref ??= await SharedPreferences.getInstance();
    Set<String>? chaves = _shPref?.getKeys();
    Map<String, String> dados = {};
    if (chaves != null) {
      for (String chave in chaves) {
        String valor = _shPref!.getString(chave) ?? '';
        dados[chave] = valor;
      }
    }
    return dados;
  }

  Future<void> savarInformacao(String informacao) async {
    String chave = DateTime.now().millisecondsSinceEpoch.toString();
    await _shPref?.setString(chave, informacao);
  }

  Future<void> deletarInformacao(String chave) async {
    _shPref!.remove(chave);
  }

  Future<void> editarInformacao(String infoAntiga, String infoNova) async {
    await deletarInformacao(infoAntiga);
    await savarInformacao(infoNova);
  }
}

