import 'package:flutter/material.dart';
import 'package:multi_app/components/responsive_container.dart';
import 'package:multi_app/controllers/auth_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    await Future.delayed(Duration(milliseconds: 3000));
    bool hasToken = await AuthController.instance.verifyToken();
    if (!mounted) return;
    Navigator.of(
      context,
    ).pushReplacementNamed(hasToken ? '/dashboard' : '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveContainer(
        child: Center(
          child: Column(
            children: [CircularProgressIndicator(), Text('Carregando...')],
          ),
        ),
      ),
    );
  }
}
