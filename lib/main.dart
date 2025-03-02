import 'package:flutter/material.dart';
import 'package:inventory_app/providers/auth_providers.dart';
import 'package:inventory_app/providers/home_provider.dart';
import 'package:inventory_app/ui/pages/home_page.dart';
import 'package:inventory_app/ui/pages/login_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('login') ?? false;
  runApp(
    MainApp(
      isLoggedIn: isLoggedIn,
    ),
  );
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        home: isLoggedIn ? HomePage() : LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
