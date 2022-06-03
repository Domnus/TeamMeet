import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../login/view/login_view.dart';

class FinalCadastro extends StatelessWidget {
  const FinalCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Get.off(const Login())
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Text('Candidatura enviada com sucesso!',
            textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary)),
        ),
      ),
    );
  }
}
