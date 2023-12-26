import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter/componentes/label_site.dart';
import 'package:prova_flutter/componentes/popup.dart';
import 'package:prova_flutter/cores/cores.dart';
import 'package:prova_flutter/store/preenchercard.dart';

class TelaInfor extends StatefulWidget {
  const TelaInfor({super.key});
  @override
  State<TelaInfor> createState() => _TelaInforState();
}

class _TelaInforState extends State<TelaInfor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(gradient: CoresPersonalizadas().corFundo),
        child: const Padding(
          padding: EdgeInsets.all(40),
          child: CapturInforma(),
        ),
      ),
    ));
  }
}

class CapturInforma extends StatefulWidget {
  const CapturInforma({super.key});

  @override
  State<CapturInforma> createState() => _CapturInformaState();
}

class _CapturInformaState extends State<CapturInforma> {
  final PreencherCard _store = PreencherCard();
  final TextEditingController _informacaoController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(child: Observer(
              builder: (_) {
                return Column(
                  children: _store.informacoes
                      .map(
                        (info) => Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey.shade400,
                                      width: 1.0))),
                          child: ListTile(
                            title: Text(info.infor),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 38,
                                  ),
                                  onPressed: () {
                                    _informacaoController.text = info.infor;
                                    _store.botaoEditClicado();
                                    _store.setCVPego(info.chave, info.infor);
                                  },
                                ),
                                IconButton(
                                  style: const ButtonStyle(
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.all(0)),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.red),
                                  ),
                                  icon: const Icon(Icons.close,
                                      color: Colors.white),
                                  onPressed: () {
                                    confirmarExclusao(
                                        context, info.chave, _store);
                                    _informacaoController.clear();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                );
              },
            )),
          ),
        ),
        const SizedBox(height: 40),
        Observer(
          builder: (_) => TextField(
            controller: _informacaoController,
            onChanged: _store.setInformacao,
            onSubmitted: _store.isEdit
                ? (_) {
                    _store.editarInformacao();
                    _informacaoController.clear();
                  }
                : (_) {
                    _store.salvarInformacao();
                    _informacaoController.clear();
                  },
            textAlign: TextAlign.center,
            cursorColor: Colors.black,
            decoration: const InputDecoration(
              hintText: 'Digite seu Texto',
              hintStyle: TextStyle(color: Colors.black),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 100),
        const PoliticasPrivacidade()
      ],
    );
  }
}
