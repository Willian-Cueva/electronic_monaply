// import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/models/enums/fichas.dart';
import 'package:electronic_monaply/models/propietario.dart';
// import 'package:electronic_monaply/models/enums/fichas.dart';
import 'package:flutter/cupertino.dart';

class JuegoControlador {
  JuegoControlador(List<String> nombres) {
    _inicializarJugadores(nombres);
  }
  List<Propietario> propietarios = [];

  void pagar(int valor, Propietario paga, Propietario recive) {
    recive.monto += valor;
    paga.monto -= valor;
  }

  void _inicializarJugadores(List<String> nombres) {
    List<Propietario> jugadores = [];
    jugadores.add(BANCO);
    for (var i = 1; i <= nombres.length; i++) {
      jugadores.add(Propietario(
          id: i,
          ficha: Fichas.values[i],
          monto: MONTO_INICIAL,
          nombre: nombres[i - 1],
          check: false,
          checkTransfer: false));
    }
    propietarios = jugadores;
  }

  void deshabilitarPropietarios() {
    for (int i = 0; i < propietarios.length; i++) {
      propietarios[i].check = false;
      propietarios[i].checkTransfer = false;
    }
  }

  List<Propietario> propietariosSinCheck() {
    return propietarios.where((element) => !element.check).toList();
  }

  bool transferir(int monto) {
    bool chis = true;
    try {
      List<Propietario> pagan =
          propietarios.where((element) => element.check).toList();
      print(pagan);
      List<Propietario> reciven =
          propietarios.where((element) => element.checkTransfer).toList();

      debugPrint("l p:${pagan.length}, l r:${reciven.length}");
      for (int i = 0; i < pagan.length; i++) {
        for (int j = 0; j < reciven.length; j++) {
          pagar(monto, pagan[i], reciven[j]);
        }
      }
      deshabilitarPropietarios();
    } catch (e) {
      print("algo pasa");
      debugPrint(e.toString());
      chis = false;
    }

    return chis;
  }
}
