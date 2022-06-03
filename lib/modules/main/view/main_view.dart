import 'package:flutter/material.dart';
import 'package:team_meet/modules/feedback/view/feedback_view.dart';
import 'package:team_meet/modules/perfil/view/perfil_view.dart';
import '../../agenda/view/agenda_view.dart';
import '../../settings/view/ajustes_view.dart';

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  static final List _views = [
    const Perfil(),
    FeedbackJogador(),
    const Agenda(),
    const Ajustes()
    ];

  static const List<Widget> _viewsTitle = <Widget>[
    Text("Perfil", style: TextStyle(color: Colors.white, fontSize: 24)),
    Text("Feedback", style: TextStyle(color: Colors.white, fontSize: 24)),
    Text("Agenda", style: TextStyle(color: Colors.white, fontSize: 24)),
    Text("Ajustes", style: TextStyle(color: Colors.white, fontSize: 24))
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        centerTitle: true,
        title: _viewsTitle[_selectedIndex],
      ),
      body: Center(
        child: _views.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.10,
        child: BottomNavigationBar(
          // Selected Items
          showSelectedLabels: false,
          selectedItemColor: Colors.white,
          selectedFontSize: 12,
          // Unselected Items
          showUnselectedLabels: false,
          unselectedItemColor: Colors.white54,
          iconSize: 32,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_outline),
                activeIcon: const Icon(Icons.person),
                label: "Perfil",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.feedback_outlined),
                activeIcon: const Icon(Icons.feedback),
                label: "Fedback",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.calendar_month_outlined),
                activeIcon: const Icon(Icons.calendar_month),
                label: "Agenda",
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings_outlined),
                activeIcon: const Icon(Icons.settings),
                label: "Ajustes",
                backgroundColor: Theme.of(context).colorScheme.primary),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
