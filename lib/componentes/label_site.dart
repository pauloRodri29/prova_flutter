import 'package:flutter/material.dart';
import 'package:prova_flutter/servicos/launcher_urls.dart';

class PoliticasPrivacidade extends StatelessWidget {
  const PoliticasPrivacidade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchInWebView(Uri(scheme: 'https', host: 'www.google.com'));
      },
      child: const Text(
        'Política de Privacidade',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
