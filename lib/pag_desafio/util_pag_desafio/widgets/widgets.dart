// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

Widget buttonsAppBar({IconData? icon, Function()? onPressed}) {
  return GestureDetector(onTap: onPressed, child: Icon(icon));
}

Widget textsResumo({
  String textCima = '',
  String textBaixo = '',
}) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Text(
              textCima,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w900),
            )
          ],
        ),
        Row(
          children: [
            Text(
              textBaixo,
              style: TextStyle(
                  color: Color.fromRGBO(31, 85, 80, 20),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700),
            )
          ],
        )
      ],
    ),
  );
}

  Widget buttonsFilter(
      {String text = '',
      Function()? onPressed,
      Color? isSelected,
      Color? isSelectedText}) {
    return SizedBox(
      height: 35,
      width: 85,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: isSelected),
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w600,
                color: isSelectedText),
          )),
    );
  }