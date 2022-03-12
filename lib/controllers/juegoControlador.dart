import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/propiedadesControlador.dart';
import 'package:electronic_monaply/models/Propiedad.dart';
import 'package:electronic_monaply/models/Propietario.dart';
import 'package:electronic_monaply/models/enums/fichas.dart';

class JuegoControlador {
  JuegoControlador(List<String> nombres) {
    _inicializarJugadores(nombres);
  }

  List<Propiedad> propiedades = [];
  List<Propietario> propietarios = [];

  void cargarPropiedades(Propietario banco) {
    propiedades = PropiedadesControlador.obtenerPropiedades(banco);
  }

  void _inicializarJugadores(List<String> nombres) {
    propietarios = [];
    Propietario banco = BANCO;
    propietarios.add(banco);
    cargarPropiedades(banco);
    for (var i = 1; i <= nombres.length; i++) {
      propietarios.add(Propietario(
          id: i, ficha: Fichas.values[i], monto: 1500, nombre: nombres[i - 1]));
    }
  }
}
