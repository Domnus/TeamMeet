import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_meet/data/get_orgs.dart';
import 'package:team_meet/models/organizacao.dart';
import 'package:team_meet/modules/cadastro/view/jogador_cadastro/jogador_email_view.dart';

class JogadorCadastro extends StatefulWidget {
  const JogadorCadastro({Key? key}) : super(key: key);

  @override
  State<JogadorCadastro> createState() => _JogadorCadastroState();
}

class _JogadorCadastroState extends State<JogadorCadastro> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getOrgs(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.waiting:
            break;

          case ConnectionState.active:
            break;

          case ConnectionState.done:
            List<Organizacao> orgs = snapshot.data as List<Organizacao>;

            return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Theme.of(context).colorScheme.primary,
              body: SafeArea(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
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
                                icon:
                                    Image.asset("assets/images/arrow_back.png"))
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'Bem-vindo!',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      fontSize: 38.00),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Times que buscam um jogador',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        fontSize: 24.00),
                                  ),
                                  //TextField(
                                  //  style: TextStyle(
                                  //      color: Theme.of(context)
                                  //          .colorScheme
                                  //          .secondary),
                                  //  decoration: InputDecoration(
                                  //    hintText: "Pesquisar",
                                  //    enabledBorder: UnderlineInputBorder(
                                  //      borderSide: BorderSide(
                                  //        color: Theme.of(context)
                                  //            .colorScheme
                                  //            .secondary,
                                  //        width: 2,
                                  //      ),
                                  //      borderRadius: const BorderRadius.only(
                                  //        topLeft: Radius.circular(4.0),
                                  //        topRight: Radius.circular(4.0),
                                  //      ),
                                  //    ),
                                  //    focusedBorder: UnderlineInputBorder(
                                  //      borderSide: BorderSide(
                                  //        color: Theme.of(context)
                                  //            .colorScheme
                                  //            .secondary,
                                  //        width: 2,
                                  //      ),
                                  //      borderRadius: const BorderRadius.only(
                                  //        topLeft: Radius.circular(4.0),
                                  //        topRight: Radius.circular(4.0),
                                  //      ),
                                  //    ),
                                  //  ),
                                  //),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.40,
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  child: NotificationListener<
                                      OverscrollIndicatorNotification>(
                                    onNotification:
                                        (OverscrollIndicatorNotification
                                            overscroll) {
                                      overscroll.disallowIndicator();
                                      return true;
                                    },
                                    child: ListView.builder(
                                        itemCount: orgs.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return ListTile(
                                            leading: Image.network(
                                              orgs[index].foto!,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.15,
                                            ),
                                            title: Text(orgs[index].nome!,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary)),
                                            selected: index == _selectedIndex,
                                            onTap: () {
                                              setState(() {
                                                _selectedIndex = index;
                                              });
                                            },
                                            selectedTileColor:
                                                const Color(0xFFB565EA),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            contentPadding: const EdgeInsets.all(10),
                                          );
                                        }),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      Get.to(const JogadorEmail());
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
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
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
                ),
              ),
            );
        }
        return const Text('');
      },
    );
  }
}
