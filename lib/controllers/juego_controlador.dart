import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/propiedades_controlador.dart';
import 'package:electronic_monaply/models/propiedad.dart';
import 'package:electronic_monaply/models/propietario.dart';
import 'package:electronic_monaply/models/enums/fichas.dart';
import 'package:flutter/cupertino.dart';

class JuegoControlador {
  JuegoControlador(int numeroJugadores) {
    _inicializarJugadores(numeroJugadores);
  }

  List<Propiedad> propiedades = [];
  List<Propietario> propietarios = [];

  bool _monopolio(Propiedad propiedad) {
    bool n = true;
    List<Propiedad> propiedadesAux = propiedades
        .where((element) => element.color == propiedad.color)
        .toList();
    Propietario p = propiedadesAux[0].propietario;
    for (var i = 1; i < propiedadesAux.length; i++) {
      if (p.nombre != propiedadesAux[i].propietario.nombre) {
        n = false;
        break;
      }
    }
    return n;
  }

  void pagar(int valor, Propietario propietario) {
    if (propietario.monto < valor) {
      List<Propiedad> uPropiedades =
          propiedades.where((element) => element.propietario.nombre==propietario.nombre&& !element.hipotecada).toList();
      int numeroPropiedades = uPropiedades.length;
      for (var i = 0; i < uPropiedades.length; i++) {
        
      }
    } else {
      propietario.monto -= valor;
    }
  }

  void pasarPorPropiedadConPropietario(
      Propietario propietario, Propiedad propiedad) {
    int valor = propiedad.alquiler;
    if (_monopolio(propiedad) && propiedad.numeroCasas == 0) {
      valor *= 2;
    } else if (propiedad.numeroCasas > 0) {
      switch (propiedad.numeroCasas) {
        case 1:
          valor = propiedad.unaCasa;
          break;
        case 2:
          valor = propiedad.dosCasa;
          break;
        case 3:
          valor = propiedad.tresCasa;
          break;
        case 4:
          valor = propiedad.cuatroCasa;
          break;
        case 5:
          valor = propiedad.hotel;
          break;
        default:
          debugPrint("Algo salío mal");
          break;
      }
    }
  }

  List<Propiedad> propiedadesSinComprar() {
    return propiedades
        .where((element) => element.propietario.nombre == "Banco")
        .toList();
  }

  void cargarPropiedades(Propietario banco) {
    propiedades = PropiedadesControlador.obtenerPropiedades(banco);
  }

  bool comprarPropiedad(Propiedad propiedad, Propietario propietario) {
    bool chis = true;
    try {
      propiedad.propietario = propietario;
      propietario.monto = propietario.monto - propiedad.precio;
    } catch (e) {
      chis = false;
      debugPrint(e.toString());
    }
    return chis;
  }

  void _inicializarJugadores(int numeroJugadores) {
    propietarios = [];
    Propietario banco = BANCO;
    propietarios.add(banco);
    cargarPropiedades(banco);
    for (var i = 1; i <= numeroJugadores; i++) {
      propietarios.add(Propietario(
          id: i, ficha: Fichas.values[i], monto: 1500, nombre: "Jugador $i"));
    }
  }
}
