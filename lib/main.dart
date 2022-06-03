import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase/supabase.dart';
import 'modules/login/view/login_view.dart';
import 'modules/main/view/main_view.dart';
import 'themes/main_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  const supabaseUrl = "https://lohpajpgesrwhwbscppz.supabase.co";
  const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxvaHBhanBnZXNyd2h3YnNjcHB6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2NTMxNjc2NTEsImV4cCI6MTk2ODc0MzY1MX0.rcwsbuJxh4wNnb1aZkdlP11JtKq_1GY4l_6sszt5a9g';

  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<SupabaseClient>(
      SupabaseClient(supabaseUrl, supabaseKey));

  if (isLoggedIn) {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Main(),
        theme: mainTheme,
      ),
    );
  } else {
    runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Login(),
        theme: mainTheme,
      ),
    );
  }
}
