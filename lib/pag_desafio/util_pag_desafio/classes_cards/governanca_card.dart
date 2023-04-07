// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print, unused_element, prefer_final_fields, curly_braces_in_flow_control_structures, await_only_futures, unnecessary_cast, unused_local_variable, prefer_for_elements_to_map_fromiterable, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:projeto_ambisis/mobx/mobx.dart';
import 'package:projeto_ambisis/database/db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:intl/intl.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/widgets/widgets.dart';

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class GovernancaCard extends StatefulWidget {
  const GovernancaCard({super.key});

  @override
  State<GovernancaCard> createState() => _GovernancaCardState();
}

class _GovernancaCardState extends State<GovernancaCard> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  StoreMobx mobxUtil = StoreMobx();
  Future<List<Map<String, dynamic>>>? buscar;

  Future<List<Map<String, dynamic>>> _buscar() async {
    Database db = await DB.get();
    return db.query('esg_goal');
  }

  @override
  void initState() {
    buscar = _buscar();
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: buscar,
        builder: (context, snapshot) {
          if (snapshot.hasData != true) return CircularProgressIndicator();
          if (snapshot.hasData) {
            var lista = snapshot.data;
            List listaTypeGovernanca = [];
            List listaIsComplete = [];
            int contadorWhile = 0;
            int contadorWhile1 = 0;
            Map contadorFor = {};
            //-----------------------------Lógica para valor Total---------------------------------------------------------
            while (contadorWhile < snapshot.data!.length) {
              listaTypeGovernanca.add(
                  (snapshot.data! as List)[contadorWhile]['type'].toString());
              contadorWhile++;
            }
            for (int i = 0; i < listaTypeGovernanca.length; i++) {
              var numero = listaTypeGovernanca[i];
              contadorFor[numero] = (contadorFor[numero] ?? 0) + 1;
            }
            //-----------------------------Lógica para valor Concluidas---------------------------------------------------------
            while (contadorWhile1 < snapshot.data!.length) {
              if ((snapshot.data! as List)[contadorWhile1]['type']
                  .toString()
                  .contains('3')) {
                listaIsComplete.add((snapshot.data! as List)[contadorWhile1]
                        ['isComplete']
                    .toString());
                contadorWhile1++;
              } else
                contadorWhile1++;
            }
            //--------------------------------------------------------------------------------------
            mobxUtil.totalGovernanca = contadorFor['3'].toDouble();
            if (listaIsComplete.contains('0')) {
              listaIsComplete.remove('0');
              mobxUtil.concluidasGovernanca = listaIsComplete.length.toString();
            }
            double d = double.parse(mobxUtil.concluidasGovernanca.toString());
            data = [
              _ChartData('', d),
            ];
            //--------------------------------------------------------------------------------------
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(8),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(Icons.terrain_rounded, size: 40),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Governança',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w600),
                                  )),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                            'Total: ${mobxUtil.totalGovernanca}'),
                                        Text(
                                            'Concluidas: ${mobxUtil.concluidasGovernanca}')
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              child: SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  primaryYAxis: NumericAxis(
                                      minimum: 0,
                                      maximum: mobxUtil.totalGovernanca,
                                      interval: 1),
                                  tooltipBehavior: _tooltip,
                                  series: <ChartSeries<_ChartData, String>>[
                                    BarSeries<_ChartData, String>(
                                        dataSource: data,
                                        xValueMapper: (_ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (_ChartData data, _) =>
                                            data.y,
                                        name: 'Gold',
                                        color: Color.fromRGBO(31, 85, 80, 20))
                                  ]),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else
            return Text('Não deu certo');
        });
  }
}
