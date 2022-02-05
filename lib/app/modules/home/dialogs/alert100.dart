import 'package:flutter/material.dart';
import 'package:get/get.dart';

void alert100({
  required String jogador,
  required String texto,
  required bool jogarNovo,
  required Function() onConfirm,
}) {
  Get.defaultDialog(
    title: jogador,
    middleText: texto,
    textConfirm: jogarNovo ? "Jogar Novamente" : "Ok",
    confirmTextColor: Colors.white,
    buttonColor: Colors.green,
    barrierDismissible: false,
    onConfirm: onConfirm,
    radius: 5,
  );
}
