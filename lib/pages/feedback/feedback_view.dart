import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'feedback_confirmado_view.dart';

class FeedbackJogador extends StatelessWidget {
  FeedbackJogador({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Text(
                      'Nos ajude a melhorar. Conte o que você achou sobre:',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Text('Nosso sistema:',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: ToggleSwitch(
                    minWidth: MediaQuery.of(context).size.width * 0.90,
                    minHeight: MediaQuery.of(context).size.height * 0.06,
                    fontSize: 16,
                    initialLabelIndex: 0,
                    totalSwitches: 3,
                    activeBgColor: [Theme.of(context).colorScheme.primary],
                    activeFgColor: Theme.of(context).colorScheme.secondary,
                    dividerColor: Colors.black87,
                    animate: true,
                    animationDuration: 300,
                    inactiveBgColor: Colors.grey[400],
                    labels: const ['Ruim', 'Bom', 'Ótimo'],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Text('Nosso ambiente de trabalho:',
                      style: TextStyle(color: Colors.black, fontSize: 20.00)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: ToggleSwitch(
                    minWidth: MediaQuery.of(context).size.width * 0.90,
                    minHeight: MediaQuery.of(context).size.height * 0.06,
                    fontSize: 16,
                    initialLabelIndex: 0,
                    totalSwitches: 3,
                    activeBgColor: [Theme.of(context).colorScheme.primary],
                    activeFgColor: Theme.of(context).colorScheme.secondary,
                    dividerColor: Colors.black87,
                    animate: true,
                    animationDuration: 300,
                    inactiveBgColor: Colors.grey[400],
                    labels: const ['Ruim', 'Bom', 'Ótimo'],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Text('O que você acha que devemos melhorar?',
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFd9d9d9),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.8),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(0.0, 1.75))
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      minLines: 3,
                      maxLines: null,
                      decoration: const InputDecoration(
                          hintText: 'Insira aqui seu texto',
                          contentPadding: EdgeInsets.all(8),
                          enabledBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          focusedBorder:
                              UnderlineInputBorder(borderSide: BorderSide.none),
                          hintStyle: TextStyle(color: Colors.black)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFd9d9d9),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0.0, 1.75))
                        ],
                      ),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color.fromARGB(255, 189, 189, 189)),
                              minimumSize: MaterialStateProperty.all<Size>(
                                  const Size.fromHeight(90))),
                          child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Enviar',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold))),
                          onPressed: () {
                            if (_controller.text.isNotEmpty) {
                              _controller.clear();
                              Get.to(const FeedBackSucesso());
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('Preencha todos os campos!',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                duration: const Duration(milliseconds: 1500),
                              ));
                            }
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
