import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';

Future<bool> connect(String email, String senha) async {
  final client = GetIt.instance<SupabaseClient>();
  final response =
      await client.from('admin').select().eq('email', email).single().execute();

  final error = response.error;

  if (error != null) {
    return Future.value(false);
  }

  final data = response.data;

  if (data != null) {
    if (data['email'] == email && data['password'] == senha) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  return Future.value(false);
}
