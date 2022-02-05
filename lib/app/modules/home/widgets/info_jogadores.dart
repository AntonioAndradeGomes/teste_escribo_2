import 'package:cobras_escadas/app/modules/home/home_controller.dart';
import 'package:cobras_escadas/app/modules/home/widgets/card_jogador.dart';
import 'package:cobras_escadas/app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoJogadores extends GetWidget<HomeController> {
  const InfoJogadores({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GetX<HomeController>(
            builder: (_) {
              return CardJogador(
                nomeJogador: 'Jogador 1',
                estagio: _.estagioJogador1,
                vez: _.vez == VEZ.J1,
                index: 1,
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
          GetX<HomeController>(
            builder: (_) {
              return CardJogador(
                nomeJogador: 'Jogador 2',
                estagio: _.estagioJogador2,
                vez: _.vez == VEZ.J2,
                index: 2,
              );
            },
          ),
        ],
      ),
    );
  }
}
