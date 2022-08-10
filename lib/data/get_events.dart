import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';

import '../models/event.dart';
import 'get_user_data.dart';

Future getEvents() async {
  final client = GetIt.instance<SupabaseClient>();
  final userData = await getUserData();
  var evs = [];

  final todo = await client
      .from('eventosJogador')
      .select()
      .eq('idJogador', userData['id'])
      .execute();

  for (var e in todo.data) {
    evs.add(e['idEvento']);
  }

  final eventos = await client
      .from('Agendamento')
      .select()
      .filter('id', 'in', evs)
      .execute();

  if (!eventos.hasError) {
    List<Event> events = [];
    for (var e in eventos.data) {
      events.add(Event(e['titulo'], e['data'], e['horario']));
    }

    return Future.value(events);
  }

  return null;
}