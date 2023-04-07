// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print, unused_element, prefer_final_fields, curly_braces_in_flow_control_structures, await_only_futures, unnecessary_cast, unused_local_variable, prefer_for_elements_to_map_fromiterable, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto_ambisis/mobx/mobx.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/widgets/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:projeto_ambisis/database/db.dart';
import 'package:intl/intl.dart';
import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/classes_cards/filtros_card.dart';

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class ResumoFiltrosCard extends StatefulWidget {
  ResumoFiltrosCard({super.key});

  @override
  State<ResumoFiltrosCard> createState() => _ResumoFiltrosCardState();
}

class _ResumoFiltrosCardState extends State<ResumoFiltrosCard> {
  late List<_ChartData> data;
  late List<_ChartData> data2Anos;
  late List<_ChartData> data5Anos;
  late List<_ChartData> data7Anos;
  late TooltipBehavior _tooltip;
  Future<List<Map<String, dynamic>>>? buscar;
  StoreMobx mobxUtil = StoreMobx();

  Future<List<Map<String, dynamic>>> _buscar() async {
    Database db = await DB.get();
    return db.query('esg_goal');
  }

  @override
  void initState() {
    mobxUtil.selectButton(3);
    mobxUtil.selectButtonFiltro(3);
    buscar = _buscar();
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  Widget descricaoCircle = Container(
    width: 8.0,
    height: 8.0,
    decoration: BoxDecoration(
      color: Color.fromRGBO(31, 85, 80, 20),
      shape: BoxShape.circle,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width,
            child: Material(
              borderRadius: BorderRadius.circular(8),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'Filtros',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600),
                              ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          buttonsFilter(
                              isSelectedText: mobxUtil.isSelected[0]
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: mobxUtil.isSelected[0]
                                  ? Color.fromRGBO(31, 85, 80, 1)
                                  : Color.fromRGBO(31, 85, 80, 0.5),
                              text: '2 Anos',
                              onPressed: () {
                                setState(() {
                                  mobxUtil.selectButton(0);
                                  mobxUtil.selectButtonFiltro(0);
                                });
                              }),
                          buttonsFilter(
                              isSelectedText: mobxUtil.isSelected[1]
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: mobxUtil.isSelected[1]
                                  ? Color.fromRGBO(31, 85, 80, 1)
                                  : Color.fromRGBO(31, 85, 80, 0.5),
                              text: '5 Anos',
                              onPressed: () {
                                setState(() {
                                  mobxUtil.selectButton(1);
                                  mobxUtil.selectButtonFiltro(1);
                                });
                              }),
                          buttonsFilter(
                              isSelectedText: mobxUtil.isSelected[2]
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: mobxUtil.isSelected[2]
                                  ? Color.fromRGBO(31, 85, 80, 1)
                                  : Color.fromRGBO(31, 85, 80, 0.5),
                              text: '7 Anos',
                              onPressed: () {
                                setState(() {
                                  mobxUtil.selectButton(2);
                                  mobxUtil.selectButtonFiltro(2);
                                });
                              }),
                          buttonsFilter(
                              isSelectedText: mobxUtil.isSelected[3]
                                  ? Colors.white
                                  : Colors.black,
                              isSelected: mobxUtil.isSelected[3]
                                  ? Color.fromRGBO(31, 85, 80, 1)
                                  : Color.fromRGBO(31, 85, 80, 0.5),
                              text: 'Todos',
                              onPressed: () {
                                setState(() {
                                  mobxUtil.selectButton(3);
                                  mobxUtil.selectButtonFiltro(3);
                                });
                              }),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        FutureBuilder(
            future: buscar,
            builder: (context, snapshot) {
              if (snapshot.hasData != true) return CircularProgressIndicator();
              if (snapshot.hasData) {
                List listaDatas = [];
                List datas = [];
                List listaConcluidas = [];
                List listaTotal = [];
                List<double> listaIdConcluidas = [];
                List<double> listaConcluidasId = [];
                int contadorWhile = 0;
                int contadorWhile1 = 0;
                List<double> valoresResumo = [];
                Map contadorFor = {};
                Map<double, double> mapaIdData = {};
                //-----------------------------Lógica para valor Datas---------------------------------------------------------
                while (contadorWhile < snapshot.data!.length) {
                  listaDatas.add((snapshot.data! as List)[contadorWhile]['date']
                      .toString());

                  listaIdConcluidas.add(double.parse(
                      (snapshot.data! as List)[contadorWhile]['id']
                          .toString()));

                  listaConcluidasId.add(double.parse(
                      (snapshot.data! as List)[contadorWhile]['isComplete']
                          .toString()));

                  mapaIdData =
                      Map.fromIterables(listaIdConcluidas, listaConcluidasId);
                  contadorWhile++;
                }

                for (String dataString in listaDatas) {
                  DateTime dataFormatada =
                      DateFormat('dd/MM/yyyy').parse(dataString);
                  DateTime dateOnly = DateTime(dataFormatada.year,
                      dataFormatada.month, dataFormatada.day);
                  String formattedDate =
                      DateFormat('dd/MM/yyyy').format(dateOnly);
                  datas.add(formattedDate);
                }

                datas.sort((a, b) {
                  int anoA = int.parse(a.split('/')[2]);
                  int anoB = int.parse(b.split('/')[2]);
                  return anoA.compareTo(anoB);
                });

                if (mobxUtil.isSelectedFiltro[0]) {
                  while (contadorWhile1 < 2) {
                    listaConcluidas.add((snapshot.data! as List)[contadorWhile1]
                            ['isComplete']
                        .toString());
                    contadorWhile1++;
                  }
                } else if (mobxUtil.isSelectedFiltro[1]) {
                  while (contadorWhile1 < 5) {
                    listaConcluidas.add((snapshot.data! as List)[contadorWhile1]
                            ['isComplete']
                        .toString());
                    contadorWhile1++;
                  }
                } else if (mobxUtil.isSelectedFiltro[2]) {
                  while (contadorWhile1 < 7) {
                    listaConcluidas.add((snapshot.data! as List)[contadorWhile1]
                            ['isComplete']
                        .toString());
                    contadorWhile1++;
                  }
                } else
                  while (contadorWhile1 < snapshot.data!.length) {
                    listaConcluidas.add((snapshot.data! as List)[contadorWhile1]
                            ['isComplete']
                        .toString());
                    contadorWhile1++;
                  }

                for (int i = 0; i < listaConcluidas.length; i++) {
                  var numero = listaConcluidas[i];
                  contadorFor[numero] = (contadorFor[numero] ?? 0) + 1;
                }

                if (mapaIdData.isNotEmpty) {
                  if (mobxUtil.isSelectedFiltro[0]) {
                    data2Anos = [
                      _ChartData(datas[0].toString(), mapaIdData[1]!),
                      _ChartData(datas[1].toString(), mapaIdData[2]!),
                    ];
                  } else if (mobxUtil.isSelectedFiltro[1]) {
                    data5Anos = [
                      _ChartData(datas[0].toString(), mapaIdData[1]!),
                      _ChartData(datas[1].toString(), mapaIdData[2]!),
                      _ChartData(datas[2].toString(), mapaIdData[3]!),
                      _ChartData(datas[3].toString(), mapaIdData[4]!),
                      _ChartData(datas[4].toString(), mapaIdData[5]!),
                    ];
                  } else if (mobxUtil.isSelectedFiltro[2]) {
                    data7Anos = [
                      _ChartData(datas[0].toString(), mapaIdData[1]!),
                      _ChartData(datas[1].toString(), mapaIdData[2]!),
                      _ChartData(datas[2].toString(), mapaIdData[3]!),
                      _ChartData(datas[3].toString(), mapaIdData[4]!),
                      _ChartData(datas[4].toString(), mapaIdData[5]!),
                      _ChartData(datas[5].toString(), mapaIdData[6]!),
                      _ChartData(datas[6].toString(), mapaIdData[7]!),
                    ];
                  } else if (mobxUtil.isSelectedFiltro[3])
                    data = [
                      _ChartData(datas[0].toString(), mapaIdData[1]!),
                      _ChartData(datas[1].toString(), mapaIdData[2]!),
                      _ChartData(datas[2].toString(), mapaIdData[3]!),
                      _ChartData(datas[3].toString(), mapaIdData[4]!),
                      _ChartData(datas[4].toString(), mapaIdData[5]!),
                      _ChartData(datas[5].toString(), mapaIdData[6]!),
                      _ChartData(datas[6].toString(), mapaIdData[7]!),
                      _ChartData(datas[7].toString(), mapaIdData[8]!),
                      _ChartData(datas[8].toString(), mapaIdData[9]!),
                      _ChartData(datas[9].toString(), mapaIdData[10]!),
                    ];
                }
                //-----------------------------Lógica para valor total Concluidas---------------------------------------------------------
                mobxUtil.concluidasGeral = contadorFor['1'].toString();
                double media = mobxUtil.isSelectedFiltro[0]
                    ? contadorFor['1'] / data2Anos.length * 10
                    : mobxUtil.isSelectedFiltro[1]
                        ? contadorFor['1'] / data5Anos.length * 10
                        : mobxUtil.isSelectedFiltro[2]
                            ? contadorFor['1'] / data7Anos.length * 10
                            : contadorFor['1'] / data.length * 10;
                String mediaAsFixed = media.toStringAsFixed(2);
                mobxUtil.mediaGeral = mediaAsFixed.toString();
                mobxUtil.crescimento =
                    ((double.parse((mobxUtil.concluidasGeral!)) -
                            double.parse(listaConcluidas.first)) /
                        double.parse(listaConcluidas.first) *
                        100);

                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.56,
                    width: MediaQuery.of(context).size.width,
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(children: [
                                Icon(Icons.bar_chart_rounded, size: 40),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Resumo',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.bold),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Regular',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      descricaoCircle
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey,
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                textsResumo(
                                    textCima: 'Crescimento',
                                    textBaixo: '${mobxUtil.crescimento}%'),
                                Container(
                                  color: Colors.grey,
                                  width: 1,
                                  height: 50,
                                ),
                                textsResumo(
                                  textCima: 'Total',
                                  textBaixo: mobxUtil.isSelectedFiltro[0]
                                      ? data2Anos.length.toString()
                                      : mobxUtil.isSelectedFiltro[1]
                                          ? data5Anos.length.toString()
                                          : mobxUtil.isSelectedFiltro[2]
                                              ? data7Anos.length.toString()
                                              : data.length.toString(),
                                ),
                                Container(
                                  color: Colors.grey,
                                  width: 1,
                                  height: 50,
                                ),
                                textsResumo(
                                    textCima: 'Média',
                                    textBaixo: mobxUtil.mediaGeral!),
                                Container(
                                  color: Colors.grey,
                                  width: 1,
                                  height: 50,
                                ),
                                textsResumo(
                                    textCima: 'Concluidas',
                                    textBaixo: mobxUtil.concluidasGeral!),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                  color: Colors.grey,
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  child: SfCartesianChart(
                                      primaryXAxis: CategoryAxis(),
                                      primaryYAxis: NumericAxis(
                                          minimum: 0.0,
                                          maximum: 3.0,
                                          interval: 0.5),
                                      tooltipBehavior: _tooltip,
                                      series: <ChartSeries<_ChartData, String>>[
                                        ColumnSeries<_ChartData, String>(
                                            name: '',
                                            dataSource: mobxUtil
                                                    .isSelectedFiltro[0]
                                                ? data2Anos
                                                : mobxUtil.isSelectedFiltro[1]
                                                    ? data5Anos
                                                    : mobxUtil
                                                            .isSelectedFiltro[2]
                                                        ? data7Anos
                                                        : data,
                                            xValueMapper:
                                                (_ChartData data, _) => data.x,
                                            yValueMapper:
                                                (_ChartData data, _) => data.y,
                                            color:
                                                Color.fromRGBO(31, 85, 80, 20))
                                      ]),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else
                return Text('Não deu certo');
            })
      ],
    );
  }
}
