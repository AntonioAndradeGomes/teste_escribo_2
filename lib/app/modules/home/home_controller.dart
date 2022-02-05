import 'dart:math';
import 'package:cobras_escadas/app/modules/home/dialogs/alert100.dart';
import 'package:cobras_escadas/app/modules/home/dialogs/parabens.dart';
import 'package:cobras_escadas/app/modules/home/dialogs/vitoria.dart';
import 'package:cobras_escadas/app/utils/consts.dart';
import 'package:cobras_escadas/app/utils/enums.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final _state = STATE.PLAY.obs;

  final _estagioJogador1 = 0.obs;
  final _estagioJogador2 = 0.obs;

  final _vez = VEZ.J1.obs;

  int get estagioJogador1 => _estagioJogador1.value;
  int get estagioJogador2 => _estagioJogador2.value;

  VEZ get vez => _vez.value;
  STATE get state => _state.value;

  Future<void> sortear() async {
    _state.value = STATE.LOADING;
    String jogador = _vez.value == VEZ.J1 ? 'Jogador 1' : 'Jogador 2';
    List<int> dados = await _sortDados();
    _state.value = STATE.PLAY;
    parabensDialog(
      vDado1: dados[0],
      vDado2: dados[1],
      jogador: jogador,
      onConfirm: () {
        Get.back();
        _updateData(
          dados[0],
          dados[1],
        );
      },
    );
  }

  void _updateData(int dado1, int dado2) {
    if (_vez.value == VEZ.J1) {
      _updateDataJ1(dado1, dado2);
    } else {
      _updateDataJ2(dado1, dado2);
    }
  }

  _updateDataJ1(int dado1, int dado2) {
    int soma = _estagioJogador1.value + dado1 + dado2;
    print('escada ' +
        escadaOrigemDestino.keys.toList().contains(soma).toString());
    print(
        'cobra ' + cobraOrigemDestino.keys.toList().contains(soma).toString());
    if (soma == 100) {
      _estagioJogador1.value = soma;
      _state.value = STATE.END;
      vitoriaDialog(
        jogador: 'Jogador 1',
        onConfirm: () => Get.back(),
      );
      return;
    } else if (dado1 == dado2) {
      //verificar se é escada
      if (escadaOrigemDestino.keys.toList().contains(soma)) {
        _estagioJogador1.value = soma;
        alert100(
          jogador: 'Jogador 1',
          texto:
              'Você encontrou uma escada, ela vai lhe levar para o estágio ${escadaOrigemDestino[soma]!}. E como os dados sortearam o mesmo número então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            _updateCobraEscada(escadaOrigemDestino[soma]!, VEZ.J1);
            sortear();
          },
        );
        return;
      } else if (cobraOrigemDestino.keys.toList().contains(soma)) {
        _estagioJogador1.value = soma;
        alert100(
          jogador: 'Jogador 1',
          texto:
              'Você encontrou infelizmente uma cobra, ela vai lhe levar para o estágio ${cobraOrigemDestino[soma]!}. E como os dados sortearam o mesmo número então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            _updateCobraEscada(cobraOrigemDestino[soma]!, VEZ.J1);
            sortear();
          },
        );
        return;
      } else if (soma > 100) {
        _vez.value = VEZ.J1;
        alert100(
          jogador: 'Jogador 1',
          texto:
              'A soma dos números sorteados com seu estágio atual foi maior de 100, mas como os dados sortearam o mesmo número então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            sortear();
          },
        );
        return;
      } else {
        _estagioJogador1.value = soma;
        _vez.value = VEZ.J1;
        alert100(
          jogador: 'Jogador 1',
          texto:
              'Os dados sortearam o mesmo número, então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            sortear();
          },
        );
        return;
      }
    } else if (escadaOrigemDestino.keys.toList().contains(soma)) {
      alert100(
        jogador: 'Jogador 1',
        texto:
            'Você encontrou uma escada, ela vai lhe levar para o estágio ${escadaOrigemDestino[soma]!}.',
        jogarNovo: false,
        onConfirm: () {
          Get.back();
          _updateCobraEscada(escadaOrigemDestino[soma]!, VEZ.J1);
        },
      );
      _vez.value = VEZ.J2;
      return;
    } else if (cobraOrigemDestino.keys.toList().contains(soma)) {
      alert100(
        jogador: 'Jogador 1',
        texto:
            'Você encontrou infelizmente uma cobra, ela vai lhe levar para o estágio ${cobraOrigemDestino[soma]!}.',
        jogarNovo: false,
        onConfirm: () {
          Get.back();
          _updateCobraEscada(cobraOrigemDestino[soma]!, VEZ.J1);
        },
      );
      _vez.value = VEZ.J2;
      return;
    } else if (soma > 100) {
      alert100(
        jogador: 'Jogador 1',
        texto:
            'A soma dos números sorteados com seu estágio atual foi maior de 100. Tente novamente na próxima vez.',
        jogarNovo: false,
        onConfirm: () {
          Get.back();
        },
      );
      _vez.value = VEZ.J2;
      return;
    } else {
      _estagioJogador1.value = soma;
      _vez.value = VEZ.J2;
      return;
    }
  }

  _updateDataJ2(int dado1, int dado2) {
    int soma = _estagioJogador2.value + dado1 + dado2;
    print('escada ' +
        escadaOrigemDestino.keys.toList().contains(soma).toString());
    print(
        'cobra ' + cobraOrigemDestino.keys.toList().contains(soma).toString());
    if (soma == 100) {
      _estagioJogador2.value = soma;
      _state.value = STATE.END;
      vitoriaDialog(
        jogador: 'Jogador 2',
        onConfirm: () => Get.back(),
      );
      return;
    } else if (dado1 == dado2) {
      //verificar se é escada
      if (escadaOrigemDestino.keys.toList().contains(soma)) {
        _estagioJogador2.value = soma;
        alert100(
          jogador: 'Jogador 2',
          texto:
              'Você encontrou uma escada, ela vai lhe levar para o estágio ${escadaOrigemDestino[soma]!}. E como os dados sortearam o mesmo número então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            _updateCobraEscada(escadaOrigemDestino[soma]!, VEZ.J2);
            sortear();
          },
        );
        return;
      } else if (cobraOrigemDestino.keys.toList().contains(soma)) {
        _estagioJogador2.value = soma;
        alert100(
          jogador: 'Jogador 2',
          texto:
              'Você encontrou infelizmente uma cobra, ela vai lhe levar para o estágio ${cobraOrigemDestino[soma]!}. E como os dados sortearam o mesmo número então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            _updateCobraEscada(cobraOrigemDestino[soma]!, VEZ.J2);
            sortear();
          },
        );
        return;
      } else if (soma > 100) {
        _vez.value = VEZ.J2;
        alert100(
          jogador: 'Jogador 2',
          texto:
              'A soma dos números sorteados com seu estágio atual foi maior de 100, mas como os dados sortearam o mesmo número então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            sortear();
          },
        );
        return;
      } else {
        _estagioJogador2.value = soma;
        _vez.value = VEZ.J2;
        alert100(
          jogador: 'Jogador 2',
          texto:
              'Os dados sortearam o mesmo número, então você pode jogar de novo.',
          jogarNovo: true,
          onConfirm: () {
            Get.back();
            sortear();
          },
        );
        return;
      }
    } else if (escadaOrigemDestino.keys.toList().contains(soma)) {
      alert100(
        jogador: 'Jogador 2',
        texto:
            'Você encontrou uma escada, ela vai lhe levar para o estágio ${escadaOrigemDestino[soma]!}.',
        jogarNovo: false,
        onConfirm: () {
          Get.back();
          _updateCobraEscada(escadaOrigemDestino[soma]!, VEZ.J2);
        },
      );
      _vez.value = VEZ.J1;
      return;
    } else if (cobraOrigemDestino.keys.toList().contains(soma)) {
      alert100(
        jogador: 'Jogador 2',
        texto:
            'Você encontrou infelizmente uma cobra, ela vai lhe levar para o estágio ${cobraOrigemDestino[soma]!}.',
        jogarNovo: false,
        onConfirm: () {
          Get.back();
          _updateCobraEscada(cobraOrigemDestino[soma]!, VEZ.J2);
        },
      );
      _vez.value = VEZ.J1;
      return;
    } else if (soma > 100) {
      alert100(
        jogador: 'Jogador 2',
        texto:
            'A soma dos números sorteados com seu estágio atual foi maior de 100. Tente novamente na próxima vez.',
        jogarNovo: false,
        onConfirm: () {
          Get.back();
        },
      );
      _vez.value = VEZ.J1;
      return;
    } else {
      _estagioJogador2.value = soma;
      _vez.value = VEZ.J1;
      return;
    }
  }

  _updateCobraEscada(int valorDestino, VEZ vez) {
    if (vez == VEZ.J1) {
      _estagioJogador1.value = valorDestino;
    } else {
      _estagioJogador2.value = valorDestino;
    }
  }

  reiniciar() {
    _estagioJogador1.value = 0;
    _estagioJogador2.value = 0;
    _vez.value = VEZ.J1;
    _state.value = STATE.PLAY;
  }

  Future<List<int>> _sortDados() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    int vDado1 = Random().nextInt(6) + 1;
    int vDado2 = Random().nextInt(6) + 1;
    if ((vDado1 + vDado2) >= 10) {
      vDado1 = Random().nextInt(6) + 1;
      vDado2 = Random().nextInt(6) + 1;
      return [vDado1, vDado2];
    } else {
      return [vDado1, vDado2];
    }
  }
}
