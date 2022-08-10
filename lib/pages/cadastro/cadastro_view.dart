import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'jogador_cadastro/jogador_cadastro_view.dart';
import 'org_cadastro/org_cadastro_view.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Eu sou...",
                      style: TextStyle(color: Colors.white, fontSize: 36)),
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Image.asset("assets/images/arrow_back.png"))
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(const JogadorCadastro());
                            },
                            iconSize: 140,
                            icon: Image.asset("assets/images/jogador_icon.png"),
                          ),
                          const Text(
                            "Jogador",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(const OrgCadastro());
                            },
                            iconSize: 140,
                            icon: Image.asset(
                                "assets/images/organizacao_icon.png"),
                          ),
                          const Text(
                            "Organização",
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
