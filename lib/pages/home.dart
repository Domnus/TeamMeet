import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        HomeVazio(),
      ],
    );
  }
}

class HomeVazio extends StatelessWidget {
  const HomeVazio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset("assets/images/home_vazio.png", width: MediaQuery.of(context).size.width * 0.80,),
        Text("Vazio", style: TextStyle(color: Theme.of(context).colorScheme.primary, fontSize: 24)),
        const Text("Que tal começar pela barra de", style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 12)),
        const Text("pesquisa?", style: TextStyle(color: Color(0xFF9A9A9A), fontSize: 12)),
      ],
    );
  }
}

