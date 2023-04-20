import 'package:flutter/material.dart';
import 'package:rehabilitation/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: Colors.white,
          ),
        ),
        colorScheme:
            ColorScheme.fromSwatch(backgroundColor: const Color(0xFF121B2F)),
      ),
      home: const HomeScreen(),
    );
  }
}
