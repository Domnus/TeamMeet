import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';
import '../models/user.dart';
import 'get_user.dart';
import 'get_user_data.dart';

Future<bool> saveData(String dataType, info) async {
  final client = GetIt.instance<SupabaseClient>();

  final Usuario? usuario = await getUser();
  final userData = await getUserData();

  const String pfpPath =
      'https://lohpajpgesrwhwbscppz.supabase.co/storage/v1/object/public/assets/images/users/';

  final perfil = await client
      .from('Pessoas')
      .select()
      .eq('id', userData['idPessoa'])
      .execute();

  if (userData != null) {
    switch (dataType) {
      case 'nome':
        if (userData['nome'] != info) {
          final response = await client.from('Pessoas').update(
              {'nome': info}).match({'id': perfil.data[0]['id']}).execute();

          if (response.hasError) {
            return Future<bool>.value(false);
          }
          return Future<bool>.value(true);
        }
        break;

      case 'data':
        if (userData['nome'] != info) {
          final response = await client
              .from('Pessoas')
              .update({'data_nascimento': info}).match(
                  {'id': perfil.data[0]['id']}).execute();

          if (response.hasError) {
            return Future<bool>.value(false);
          }
          return Future<bool>.value(true);
        }
        break;

      case 'foto':
        String imageName = info.path;
        final response = await client.storage
            .from('assets')
            .remove(['images/users/' + imageName]);

        if (response.hasError) {
          return Future<bool>.value(false);
        } else {
          final response = await client.storage
              .from('assets')
              .upload('/images/users/' + imageName, info);

          if (response.hasError) {
            return Future<bool>.value(false);
          } else {
            final response = await client
                .from('Pessoas')
                .update({'fotoPerfil': pfpPath + imageName})
                .eq('id', usuario?.id)
                .execute();

            if (response.hasError) {
              return Future<bool>.value(false);
            }
          }
          return Future<bool>.value(true);
        }

      case 'evento':
        if (!DateTime.parse(info.data).isBefore(DateTime.now())) {
          final eResponse = await client.from('Agendamento').insert({
            'data': info.data,
            'horario': info.horario,
            'titulo': info.title
          }).execute();

          if (!eResponse.hasError) {
            final response = await client.from('eventosJogador').insert({
              'idJogador': usuario?.id,
              'idEvento': eResponse.data[0]['id']
            }).execute();

            if (response.hasError) {
              return Future<bool>.value(true);
            }
          } else {
            return Future<bool>.value(true);
          }

          return Future<bool>.value(true);
        } else {
          return Future<bool>.value(false);
        }
    }
  }
  return Future<bool>.value(false);
}
