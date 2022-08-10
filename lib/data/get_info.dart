import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';

import '../models/organizacao.dart';
import 'get_user_data.dart';

Future getInfo() async {
  final client = GetIt.instance<SupabaseClient>();

  final userData = await getUserData();
  if (userData != null) {
    final userTime = userData['timeAtual'];
    final org =
        await client.from('Organização').select().eq('id', userTime).execute();

    final orgData = org.data[0];

    final playerData = await client
        .from('Jogadores')
        .select()
        .eq('timeAtual', orgData['id'])
        .execute();
    int? playerCount = playerData.count;
    playerCount ??= 0;

    final coachData = await client
        .from('Treinadores')
        .select()
        .eq('timeAtual', orgData['id'])
        .execute();
    int? coachCount = coachData.count;
    coachCount ??= 0;

    if (orgData != null) {
      Organizacao organizacao = Organizacao(
          orgData['id'],
          orgData['nome'],
          orgData['cnpj'],
          orgData['jogos'],
          playerCount,
          coachCount,
          orgData['idJogador'],
          orgData['foto']);

      return Future.value(organizacao);
    }
  }

  return null;
}