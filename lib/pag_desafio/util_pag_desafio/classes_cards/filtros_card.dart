// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, avoid_print, unused_element, prefer_final_fields, curly_braces_in_flow_control_structures, await_only_futures, unnecessary_cast, unused_local_variable, prefer_for_elements_to_map_fromiterable, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages

// import 'package:flutter/material.dart';
// import 'package:projeto_ambisis/mobx/mobx.dart';
// import 'package:projeto_ambisis/pag_desafio/util_pag_desafio/widgets/widgets.dart';

// class FiltrosCard extends StatefulWidget {
//   const FiltrosCard({super.key});

//   @override
//   State<FiltrosCard> createState() => _FiltrosCardState();
// }

// class _FiltrosCardState extends State<FiltrosCard> {
//   StoreMobx mobxUtil = StoreMobx();
//   List<bool> _isSelected = [false, false, false, false];

//   void _selectButton(int index) {
//     setState(() {
//       for (int i = 0; i < _isSelected.length; i++) {
//         if (i == index) {
//           _isSelected[i] = true;
//         } else {
//           _isSelected[i] = false;
//         }
//       }
//     });
//   }

//   // void selectButtonFiltro(int index) {
//   //   for (int i = 0; i < mobxUtil.isSelectedFiltro.length; i++) {
//   //     if (i == index) {
//   //       mobxUtil.isSelectedFiltro[i] = true;
//   //     } else {
//   //       mobxUtil.isSelectedFiltro[i] = false;
//   //     }
//   //   }
//   // }

//   @override
//   void initState() {
//     _selectButton(3);
//     _selectButtonFiltros(3);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.15,
//         width: MediaQuery.of(context).size.width,
//         child: Material(
//           borderRadius: BorderRadius.circular(8),
//           elevation: 2,
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Container(
//                           padding: EdgeInsets.all(8),
//                           child: Text(
//                             'Filtros',
//                             style: TextStyle(
//                                 fontSize: 20,
//                                 fontFamily: 'Poppins',
//                                 fontWeight: FontWeight.w600),
//                           ))
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       buttonsFilter(
//                           isSelectedText:
//                               _isSelected[0] ? Colors.white : Colors.black,
//                           isSelected: _isSelected[0]
//                               ? Color.fromRGBO(31, 85, 80, 1)
//                               : Color.fromRGBO(31, 85, 80, 0.5),
//                           text: '2 Anos',
//                           onPressed: () {
//                             print('tapo 2 anos');
//                             setState(() {
//                               print('aqui 01');
//                               print(mobxUtil.isSelectedFiltro[0]);
//                               print('aqui 01');
//                               _selectButton(0);
//                               mobxUtil.selectButtonFiltro(0);
//                             });
//                           }),
//                       buttonsFilter(
//                           isSelectedText:
//                               _isSelected[1] ? Colors.white : Colors.black,
//                           isSelected: _isSelected[1]
//                               ? Color.fromRGBO(31, 85, 80, 1)
//                               : Color.fromRGBO(31, 85, 80, 0.5),
//                           text: '5 Anos',
//                           onPressed: () {
//                             print('tapo 5 anos');
//                             setState(() {
//                               print('aqui 02');
//                               print(mobxUtil.isSelectedFiltro[1]);
//                               print('aqui 02');
//                               _selectButton(1);
//                               mobxUtil.selectButtonFiltro(1);
//                             });
//                           }),
//                       buttonsFilter(
//                           isSelectedText:
//                               _isSelected[2] ? Colors.white : Colors.black,
//                           isSelected: _isSelected[2]
//                               ? Color.fromRGBO(31, 85, 80, 1)
//                               : Color.fromRGBO(31, 85, 80, 0.5),
//                           text: '7 Anos',
//                           onPressed: () {
//                             print('tapo 7 anos');
//                             setState(() {
//                               mobxUtil.isSelectedFiltro[2] = true;
//                               print('aqui 03');
//                               print(mobxUtil.isSelectedFiltro[2]);
//                               print('aqui 03');
//                               _selectButton(2);
//                               // selectButtonFiltro(2);
//                             });
//                           }),
//                       buttonsFilter(
//                           isSelectedText:
//                               _isSelected[3] ? Colors.white : Colors.black,
//                           isSelected: _isSelected[3]
//                               ? Color.fromRGBO(31, 85, 80, 1)
//                               : Color.fromRGBO(31, 85, 80, 0.5),
//                           text: 'Todos',
//                           onPressed: () {
//                             setState(() {
//                               print('aqui 04');
//                               print(mobxUtil.isSelectedFiltro[3]);
//                               print('aqui 04');
//                               _selectButton(3);
//                               mobxUtil.selectButtonFiltro(3);
//                             });
//                           }),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
