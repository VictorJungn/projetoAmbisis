import 'package:flutter/material.dart';
import 'package:projeto_ambisis/pag_desafio/pag_desafio.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pressione para ser direcionado a tela de desafio!',
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PagDesafio(),
                    ),
                  );
                },
                child: const Icon(Icons.home)),
          ],
        ),
      ),
    );
  }
}
