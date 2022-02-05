import 'package:cobras_escadas/app/modules/home/home_controller.dart';
import 'package:cobras_escadas/app/modules/home/widgets/button_game.dart';
import 'package:cobras_escadas/app/modules/home/widgets/ignore_pointer.dart';
import 'package:cobras_escadas/app/modules/home/widgets/info_jogadores.dart';
import 'package:cobras_escadas/app/modules/home/widgets/tabuleiro.dart';
import 'package:cobras_escadas/app/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Column(
              children: const [
                InfoJogadores(),
                ButtonGame(),
                Tabuleiro(),
              ],
            ),
          ),
        ),
        GetX<HomeController>(
          builder: (_) => IgoneLoading(
            ignoring: _.state == STATE.LOADING,
          ),
        ),
      ],
    );
  }
}
