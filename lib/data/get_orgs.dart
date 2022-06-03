import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';
import 'package:team_meet/models/organizacao.dart';

Future<List<Organizacao>?> getOrgs() async {
  List<Organizacao> orgs = [];
  final client = GetIt.instance<SupabaseClient>();
  final response =
      await client.from('Organização').select('nome, foto').execute();

  final error = response.error;

  if (error != null) {
    return orgs;
  }

  final data = response.data;

  if (data != null) {
    for (var org in data) {
      orgs.add(Organizacao(
          org['id'],
          org['nome'],
          org['cnpj'],
          org['jogos'],
          org['idAgendamento'],
          org['treinadores'],
          org['jogadores'],
          org['foto']));
    }

    return orgs;
  } 

  return orgs;
}
