import 'package:flutter/material.dart';
import 'package:get/get.dart';

void vitoriaDialog({
  required String jogador,
  required Function() onConfirm,
}) {
  Get.defaultDialog(
    title: 'Parábens $jogador',
    middleText: '$jogador acabou de vencer a partida!',
    textConfirm: "Confirmar",
    confirmTextColor: Colors.white,
    buttonColor: Colors.green,
    textCancel: 'Fechar',
    onCancel: () => Get.back(),
    barrierDismissible: false,
    onConfirm: onConfirm,
    radius: 5,
  );
}
