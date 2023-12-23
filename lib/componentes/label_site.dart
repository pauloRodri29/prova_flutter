import 'package:flutter/material.dart';
import 'package:prova_flutter/servicos/launcher_urls.dart';

class PoliticasPrivacidade extends StatelessWidget {
  final Uri url;
  const PoliticasPrivacidade({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: () {
            launchInWebView(url);
          },
          child: const Text(
            'Política de Privacidade',
            style: TextStyle(color: Colors.white),
          ),
        );
  }
}