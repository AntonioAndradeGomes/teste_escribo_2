import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardJogador extends StatelessWidget {
  final String nomeJogador;
  final int estagio;
  final int index;
  final bool vez;
  const CardJogador({
    Key? key,
    required this.nomeJogador,
    required this.estagio,
    required this.vez,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: vez ? 30 : 0,
      color: estagio == 100 ? const Color(0xFFFFD700) : Colors.purple,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            estagio == 100
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        FontAwesomeIcons.trophy,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 40,
                        child: Image.asset(
                          'assets/images/p$index.png',
                        ),
                      )
                    ],
                  )
                : const SizedBox(),
            vez
                ? SizedBox(
                    width: 40,
                    child: Image.asset(
                      'assets/images/p$index.png',
                    ),
                  )
                : const SizedBox(),
            Text(
              nomeJogador,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              'Estagio: $estagio',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
