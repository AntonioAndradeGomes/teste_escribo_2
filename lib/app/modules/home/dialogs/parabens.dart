import 'package:flutter/material.dart';
import 'package:get/get.dart';

void parabensDialog({
  required int vDado1,
  required int vDado2,
  required String jogador,
  required Function() onConfirm,
}) {
  Get.defaultDialog(
    title: 'Parábens',
    // middleText: '$jogador tirou no sorteio ${vDado1 + vDado2}',
    textConfirm: "Confirmar",
    confirmTextColor: Colors.white,
    buttonColor: Colors.green,
    barrierDismissible: false,
    onConfirm: onConfirm,
    radius: 5,
    content: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset("assets/images/dice$vDado1.png"),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              height: 80,
              width: 80,
              child: Image.asset("assets/images/dice$vDado2.png"),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          '$jogador tirou no sorteio o valor ${vDado1 + vDado2}',
        )
      ],
    ),
  );
}
