import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_meet/modules/cadastro/view/final_view.dart';

class OrgCadastro extends StatefulWidget {
  const OrgCadastro({Key? key}) : super(key: key);

  @override
  State<OrgCadastro> createState() => _OrgCadastroState();
}

class _OrgCadastroState extends State<OrgCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset("assets/images/arrow_back.png"))
                  ],
                ),
                Text('Bem-vindo!',
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.secondary,
                        fontSize: 40.00)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Nome da organização:',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 24.00)),
                            TextField(
                              controller: _nomeController,
                              cursorColor:
                                  Theme.of(context).colorScheme.secondary,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary),
                              decoration: InputDecoration(
                                hintText: 'Red Canids',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email da organização:',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    fontSize: 24.00)),
                            TextField(
                              controller: _emailController,
                              cursorColor:
                                  Theme.of(context).colorScheme.secondary,
                              style: TextStyle(
                                  color: Theme.of(context).colorScheme.secondary),
                              decoration: InputDecoration(
                                hintText: 'redcanids@yahoo.com.br',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    width: 2,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(4.0),
                                    topRight: Radius.circular(4.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_emailController.text.isEmail && _nomeController.text.isNotEmpty) {
                        Get.to(const FinalCadastro());
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(
                          content: Text('Nome ou email inválido!',
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary)),
                          duration: const Duration(milliseconds: 1500),
                        ));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        'Continuar',
                        style: TextStyle(
                          fontSize: 24,
                          color: Color(0xFF810FCC),
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.secondary),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
