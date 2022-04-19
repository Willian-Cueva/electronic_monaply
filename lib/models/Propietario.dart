import 'package:electronic_monaply/models/enums/fichas.dart';

class Propietario {
  Propietario(
      {required this.id,
      required this.ficha,
      required this.monto,
      required this.nombre,
      required this.check,
      required this.checkTransfer});
  int id;
  Fichas ficha;
  int monto;
  String nombre;
  bool check;
  bool checkTransfer;
}
