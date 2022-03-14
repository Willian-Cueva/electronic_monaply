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
