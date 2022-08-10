import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';

import '../models/user.dart';
import 'get_user.dart';

Future getUserData() async {
  final client = GetIt.instance<SupabaseClient>();

  final Usuario usuario = await getUser() ?? Usuario(0, '', '', '', '', '');

  final user =
      await client.from('Jogador').select().eq('id', usuario.id).execute();
  final userData = user.data[0];

  return userData;
}