import 'package:flutter/material.dart';
import 'package:multi_app/components/responsive_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
