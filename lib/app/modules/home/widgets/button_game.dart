import 'package:cobras_escadas/app/modules/home/home_controller.dart';
import 'package:cobras_escadas/app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonGame extends GetWidget<HomeController> {
  const ButtonGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      builder: (_) {
        return ElevatedButton(
          onPressed:
              _.state == STATE.END ? () => _.reiniciar() : () => _.sortear(),
          child: Text(
            _.state == STATE.END ? 'Reiniciar Jogo' : 'Rolar Dados',
          ),
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(150, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5), // <-- Radius
            ),
          ),
        );
      },
    );
  }
}
