// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/classes_cards/governanca_card.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/widgets/widgets.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/classes_cards/filtros_card.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/classes_cards/ambiental_card.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/classes_cards/resumo_filtros_card.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/classes_cards/social_card.dart';

class PagDesafio extends StatefulWidget {
  PagDesafio({super.key});

  @override
  State<PagDesafio> createState() => _PagDesafioState();
}

class _PagDesafioState extends State<PagDesafio> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Scaffold(
          backgroundColor: const Color.fromRGBO(223, 223, 223, 100),
          appBar: AppBar(
            elevation: 5,
            title: const Text('Dashboard ESG'),
            actions: [
              buttonsAppBar(
                  icon: Icons.cloud_outlined,
                  onPressed: () {
                    print('tap nuvem');
                  }),
              const SizedBox(
                width: 10,
              ),
              buttonsAppBar(
                  icon: Icons.textsms_outlined,
                  onPressed: () {
                    print('tap texto');
                  }),
              const SizedBox(
                width: 10,
              ),
              buttonsAppBar(
                  icon: Icons.filter_list_sharp,
                  onPressed: () {
                    print('tap filtro');
                  }),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              ResumoFiltrosCard(),
              AmbientalCard(),
              SocialCard(),
              GovernancaCard(),
            ]),
          ),
        ),
      ),
    );
  }
}
