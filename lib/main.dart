import 'package:flutter/material.dart';
import 'package:projeto_ambisis/home/home.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Ambisis',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromRGBO(31, 85, 80, 100),
            brightness: Brightness.light,
            primary: const Color.fromRGBO(31, 85, 80, 100),
            secondary: const Color.fromRGBO(0, 0, 0, 100),
          )),
      home: const Home(title: 'Home Pag'),
    );
  }
}
