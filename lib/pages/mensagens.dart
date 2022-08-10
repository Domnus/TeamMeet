import 'package:flutter/material.dart';

class Mensagens extends StatefulWidget {
  const Mensagens({Key? key}) : super(key: key);

  @override
  State<Mensagens> createState() => _MensagensState();
}

class _MensagensState extends State<Mensagens> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const MensagensVazias(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: FloatingActionButton.extended(
              onPressed: () {},
              backgroundColor: const Color(0xFFB361E9),
              label: Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text("Iniciar conversa...",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 16)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MensagensVazias extends StatelessWidget {
  const MensagensVazias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset("assets/images/mensagens_vazio.png", width: MediaQuery.of(context).size.width * 0.80),
      Text("Vazio", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 24)),
      const Text("Suas conversas aparecerão aqui", style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 12)),
    ],);
  }
}

