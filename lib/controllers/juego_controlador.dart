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

  List<Propietario> getParticipantes() {
    return propietarios.where((element) => element.nombre != "Banco").toList();
  }

  List<Propiedad> propiedades = [];
  List<Propietario> propietarios = [];

  List<Propiedad> getPropiedadesDeUnPropietario(Propietario propietario) {
    return propiedades
        .where((element) => element.propietario.nombre == propietario.nombre)
        .toList();
  }

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

  bool compraPropiedadSubasta(
      int valor, Propietario propietario, Propiedad propiedad) {
    bool chis = false;
    if (propietario.monto >= valor) {
      propiedad.propietario = propietario;
      propietario.monto -= valor;
      chis = true;
    }
    return chis;
  }

  int valorDELaSiguienteCasa(Propiedad propiedad) {
    int valor = 0;
    if (propiedad.numeroCasas < 5) {
      switch (propiedad.numeroCasas) {
        case 4:
          valor = propiedad.valorHotel;
          break;
        default:
          valor = propiedad.valorCasa;
          break;
      }
    }
    return valor;
  }

  bool comprarCasa(Propiedad propiedad, Propietario propietario) {
    bool chis = false;

    if (valorDELaSiguienteCasa(propiedad) != 0) {
      if (propietario.monto >= valorDELaSiguienteCasa(propiedad)) {
        propietario.monto -= valorDELaSiguienteCasa(propiedad);
        propiedad.numeroCasas++;
        chis = true;
      }
    }

    return chis;
  }

  bool pagar(int valor, Propietario propietario) {
    bool chis = true;
    if (valor > 0) {
      propietario.monto += valor;
    } else {
      if (propietario.monto < valor) {
        List<Propiedad> uPropiedades = propiedades
            .where((element) =>
                element.propietario.nombre == propietario.nombre &&
                !element.hipotecada)
            .toList();
        int newMonto = propietario.monto;
        for (var i = 0; i < uPropiedades.length; i++) {
          debugPrint("si entra");
          if (!uPropiedades[i].hipotecada) {
            switch (uPropiedades[i].numeroCasas) {
              case 5:
                newMonto += uPropiedades[i].valorHotel;
                break;
              default:
                newMonto +=
                    uPropiedades[i].valorCasa * uPropiedades[i].numeroCasas;
                break;
            }
            uPropiedades[i].numeroCasas = 0;
            if (!(newMonto >= valor)) {
              newMonto += uPropiedades[i].valorHipotecable;
              uPropiedades[i].hipotecada = true;
            }
          }
          if (newMonto >= valor) {
            propietario.monto += valor;
          }
        }
      } else {
        propietario.monto += valor;
      }
    }
    return chis;
  }

  bool pasarPorPropiedadConPropietario(
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
    return pagar(-valor, propietario);
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
    bool chis = false;
    if (propietario.monto >= propiedad.precio) {
      propiedad.propietario = propietario;
      propietario.monto = propietario.monto - propiedad.precio;
      chis = true;
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
          id: i,
          ficha: Fichas.values[i],
          monto: DINEROINICIO,
          nombre: "Jugador $i"));
    }
  }
}
