import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';
import 'dart:io';

import '../../cadastro/view/cadastro_view.dart';
import '../../main/view/main_view.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  late bool _senhaVisivel = false;

  Future<bool> connect(String email, String senha) async {
    final client = GetIt.instance<SupabaseClient>();
    final response = await client
        .from('admin')
        .select()
        .eq('email', email)
        .single()
        .execute();

    final error = response.error;

    if (error != null) {
      return Future.value(false);
    }

    final data = response.data;

    if (data != null) {
      if (data['email'] == email && data['password'] == senha) {
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    }

    return Future.value(false);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: MediaQuery.of(context).size.width * 0.50,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Email',
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 32,
                                    )),
                                TextField(
                                  controller: _emailController,
                                  obscureText: false,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  cursorColor: Colors.white,
                                  decoration: InputDecoration(
                                    hintText: 'roberto_seiti@example.com',
                                    hintStyle:
                                        const TextStyle(color: Colors.white70),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          width: 2),
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0)),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          width: 2),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Senha',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 32),
                                ),
                                TextField(
                                  controller: _senhaController,
                                  obscureText: !_senhaVisivel,
                                  enableSuggestions: false,
                                  autocorrect: false,
                                  cursorColor: Colors.white,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                  decoration: InputDecoration(
                                    hintText: '●●●●●●●●●●●●●●●',
                                    hintStyle:
                                        const TextStyle(color: Colors.white70),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                          _senhaVisivel
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary),
                                      onPressed: () {
                                        setState(
                                          () {
                                            _senhaVisivel = !_senhaVisivel;
                                          },
                                        );
                                      },
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        width: 2,
                                      ),
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                  ),
                                ),
                                //Align(
                                //  alignment: Alignment.centerRight,
                                //  child: TextButton(
                                //    onPressed: () {},
                                //    child: Text(
                                //      'Esqueci minha senha',
                                //      style: TextStyle(
                                //          color: Theme.of(context)
                                //              .colorScheme
                                //              .secondary),
                                //      textAlign: TextAlign.right,
                                //    ),
                                //  ),
                                //),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();

                                  final success = await connect(
                                      _emailController.text,
                                      _senhaController.text);

                                  if (success) {
                                    await prefs.setBool('isLoggedIn', true);
                                    await prefs.setString(
                                        'usuario', _emailController.text);
                                    await prefs.setString(
                                        'senha', _senhaController.text);

                                    Get.off(() => const Main(),
                                        transition: Transition.circularReveal);
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(
                                          'Ocorreu um erro! Tente novamente mais tarde.',
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary)),
                                      duration:
                                          const Duration(milliseconds: 1500),
                                    ));
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(20.0),
                                  child: Text(
                                    'ENTRAR',
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Color(0xFF810FCC),
                                    ),
                                  ),
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<
                                          Color>(
                                      Theme.of(context).colorScheme.secondary),
                                ),
                              ),
                            ),
                            //Text(
                            //  'OU',
                            //  style: TextStyle(
                            //      color:
                            //          Theme.of(context).colorScheme.secondary),
                            //),
                            //Row(
                            //  mainAxisSize: MainAxisSize.max,
                            //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //  crossAxisAlignment: CrossAxisAlignment.center,
                            //  children: [
                            //    IconButton(
                            //      onPressed: () {},
                            //      icon: Image.asset(
                            //          'assets/images/apple_logo.png',
                            //          fit: BoxFit.contain),
                            //      iconSize: 70,
                            //    ),
                            //    IconButton(
                            //      onPressed: () {},
                            //      icon: Image.asset(
                            //          'assets/images/google_logo.png',
                            //          fit: BoxFit.contain),
                            //      iconSize: 70,
                            //    ),
                            //  ],
                            //),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Não tem uma conta?',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    try {
                                      final result =
                                          await InternetAddress.lookup(
                                              'google.com');
                                      if (result.isNotEmpty &&
                                          result[0].rawAddress.isNotEmpty) {
                                        Get.to(() => const Cadastro(),
                                            transition: Transition.rightToLeft);
                                      }
                                    } on SocketException catch (_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'Sem conexão com a internet!',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .secondary)),
                                        duration:
                                            const Duration(milliseconds: 1500),
                                      ));
                                    }
                                  },
                                  child: Text(
                                    'Cadastre-se',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
