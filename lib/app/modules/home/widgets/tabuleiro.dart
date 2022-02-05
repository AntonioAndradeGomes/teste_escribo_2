import 'package:flutter/material.dart';

import 'item_tabuleiro.dart';

class Tabuleiro extends StatelessWidget {
  const Tabuleiro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: 100,
        reverse: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => ItemTabuleiro(
          index: index,
        ),
      ),
    );
  }
}
