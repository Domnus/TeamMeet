import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/login.dart';
import 'themes/main_theme.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Login(),
        theme: mainTheme,
        );
      }   
}
