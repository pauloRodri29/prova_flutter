import 'package:flutter/material.dart';
import 'package:prova_flutter/cores/cores.dart';

class TelaInfor extends StatelessWidget {
  const TelaInfor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: CoresPersonalizadas().corFundo),
        child: const Padding(padding: EdgeInsets.all(40)),
      ),
    );
  }
}

class CapturaInfor extends StatefulWidget {
  const CapturaInfor({super.key});

  @override
  State<CapturaInfor> createState() => _CapturaInforState();
}

class _CapturaInforState extends State<CapturaInfor> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}