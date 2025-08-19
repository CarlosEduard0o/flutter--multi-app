import 'package:flutter/material.dart';
import 'package:multi_app/shared/app_constants.dart';
import 'package:multi_app/shared/app_theme.dart';
import 'package:multi_app/views/dashboard_page.dart';
import 'package:multi_app/views/home_page.dart';
import 'package:multi_app/views/login_page.dart';
import 'package:multi_app/views/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        //Basicamente toda rota te o context, para a página saber onde ela está, para onde ela vai, ela recebe a pilha de páginas...
        '/': (context) => SplashScreen(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/dashboard': (context) => DashboardPage(),
      },
    );
  }
}
