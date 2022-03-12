import 'package:electronic_monaply/models/enums/fichas.dart';

class Propietario {
  Propietario(
      {required this.id,
      required this.ficha,
      required this.monto,
      required this.nombre});
  int id;
  Fichas ficha;
  int monto;
  String nombre;
}
