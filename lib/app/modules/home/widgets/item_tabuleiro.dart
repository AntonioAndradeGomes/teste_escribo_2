import 'package:cobras_escadas/app/modules/home/home_controller.dart';
import 'package:cobras_escadas/app/theme/colors/tabuleiro_colors.dart';
import 'package:cobras_escadas/app/utils/consts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ItemTabuleiro extends GetWidget<HomeController> {
  final int index;
  const ItemTabuleiro({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            5,
          ),
        ),
        color: tabuleiroColor(index),
      ),
      child: Stack(
        children: [
          index == 99
              ? const Center(
                  child: Icon(
                    FontAwesomeIcons.trophy,
                    color: Colors.yellow,
                  ),
                )
              : const SizedBox(),
          index == 0
              ? const Center(
                  child: Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.yellow,
                  ),
                )
              : const SizedBox(),
          escadaOrigemDestino.keys.toList().contains(index + 1)
              ? Image.asset("assets/images/stair.png")
              : const SizedBox(),
          cobraOrigemDestino.keys.toList().contains(index + 1)
              ? Image.asset("assets/images/snake.png")
              : const SizedBox(),
          Center(
            child: Text(
              '${index + 1}',
            ),
          ),
          GetX<HomeController>(
            builder: (_) {
              if (_.estagioJogador1 == index + 1 &&
                  _.estagioJogador1 != _.estagioJogador2) {
                return Image.asset("assets/images/p1.png");
              } else if (_.estagioJogador2 == index + 1 &&
                  _.estagioJogador1 != _.estagioJogador2) {
                return Image.asset("assets/images/p2.png");
              } else if (_.estagioJogador1 != 0 &&
                  _.estagioJogador1 == index + 1 &&
                  _.estagioJogador2 == index + 1 &&
                  _.estagioJogador1 == _.estagioJogador2) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        height: 13,
                        width: 13,
                        child: Image.asset("assets/images/p1.png")),
                    SizedBox(
                        height: 13,
                        width: 13,
                        child: Image.asset("assets/images/p2.png")),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    );
  }
}
