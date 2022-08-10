import 'package:flutter/material.dart';
import 'package:team_meet/models/organizacao.dart';

import '../data/get_events.dart';
import '../data/get_info.dart';
import '../models/event.dart';

class Perfil extends StatelessWidget {
  const Perfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      initialData: const [],
      future: Future.wait([getInfo(), getEvents()]),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            break;

          case ConnectionState.waiting:
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [CircularProgressIndicator(), Text('Carregando')],
            ));

          case ConnectionState.active:
            break;

          case ConnectionState.done:
            List? dados = snapshot.data as List?;
            List toRemove = [];

            if (dados != null) {
              final organizacao = dados[0] as Organizacao;
              final agenda = dados[1] as List<Event>;

              for (Event ev in agenda) {
                if (DateTime.parse(ev.data).isBefore(DateTime.now())) {
                  toRemove.add(ev);
                }
              }

              dados.removeWhere((e) => toRemove.contains(e));

              return SafeArea(
                child: ListView(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFf7f5f5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0.0, 1.75))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(12),
                                    child: Text(
                                      'Organização',
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Image.network(organizacao.foto!,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.06),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                12, 8, 8, 12),
                                            child: Text(organizacao.nome!,
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 12, 8, 8),
                                    child: Text(
                                        organizacao.jogadores.toString() +
                                            ((organizacao.jogadores! > 0)
                                                ? ' jogador'
                                                : ' jogadores'),
                                        style: const TextStyle(fontSize: 16)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        organizacao.treinadores.toString() +
                                            ((organizacao.treinadores! > 0)
                                                ? ' treinador'
                                                : ' treinadores'),
                                        style: const TextStyle(fontSize: 16)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFf7f5f5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0.0, 1.75))
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(12, 0, 0, 12),
                                      child: Text('Agenda',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 8),
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
                                    child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: agenda.length,
                                      itemBuilder: (context, index) {
                                        String dia =
                                            DateTime.parse(agenda[index].data)
                                                .day
                                                .toString();
                                        String mes =
                                            DateTime.parse(agenda[index].data)
                                                .month
                                                .toString();
                                        String ano =
                                            DateTime.parse(agenda[index].data)
                                                .year
                                                .toString();

                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 8, 12, 12),
                                                child: Text(agenda[index].title,
                                                    style: const TextStyle(
                                                        fontSize: 20)),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        12, 0, 12, 8),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      dia +
                                                          '/' +
                                                          mes +
                                                          '/' +
                                                          ano,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    Text(
                                                      agenda[index].horario,
                                                      style: const TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }
        }

        return const Text("Erro inesperado, tente novamente mais tarde");
      },
    );
  }
}
