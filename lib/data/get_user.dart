import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase/supabase.dart';

import '../models/user.dart';

Future<Usuario?> getUser() async {
  final client = GetIt.instance<SupabaseClient>();
  final prefs = await SharedPreferences.getInstance();

  final String? email = prefs.getString('usuario');
  final String? senha = prefs.getString('senha');
  final response =
      await client.from('admin').select().eq('email', email).single().execute();

  final error = response.error;

  if (error != null) {}

  final data = response.data;

  if (data != null) {
    if (data['email'] == email && data['password'] == senha) {
      final perfil = await client
          .from('Pessoas')
          .select()
          .eq('id', data['idPessoa'])
          .execute();

      final ano =
          DateTime.parse(perfil.data[0]['data_nascimento']).year;
      final mes =
          DateTime.parse(perfil.data[0]['data_nascimento']).month;
      final dia =
          DateTime.parse(perfil.data[0]['data_nascimento']).day;
      final dataNascimento = dia.toString() + '/' + mes.toString() + '/' + ano.toString();
      return Usuario(
          data['idPessoa'],
          perfil.data[0]['nome'],
          dataNascimento,
          data['email'],
          data['password'],
          perfil.data[0]['fotoPerfil']);
    } else {
      return null;
    }
  }

  return null;
}