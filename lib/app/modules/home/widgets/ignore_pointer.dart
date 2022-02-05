import 'package:flutter/material.dart';

class IgoneLoading extends StatelessWidget {
  final bool ignoring;
  const IgoneLoading({
    Key? key,
    required this.ignoring,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !ignoring,
      child: Container(
        color: ignoring ? Colors.black54 : Colors.transparent,
        child: !ignoring
            ? null
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/gifs/dados.gif',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Material(
                      color: Colors.transparent,
                      child: Text(
                        'Realizando o sorteio em dois dados',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
