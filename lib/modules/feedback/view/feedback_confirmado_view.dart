import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeedBackSucesso extends StatelessWidget {
  const FeedBackSucesso({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Get.back()
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.primary,
        body: Center(
          child: Text('FeedBack enviado com sucesso!',
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