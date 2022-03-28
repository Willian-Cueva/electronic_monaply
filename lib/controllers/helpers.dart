// ignore: constant_identifier_names
import 'package:electronic_monaply/models/propietario.dart';
import 'package:electronic_monaply/models/enums/colores.dart';
import 'package:electronic_monaply/models/enums/fichas.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const ASSETJSON = "assets/json/";

// ignore: non_constant_identifier_names
Propietario BANCO =
    Propietario(id: 0, ficha: Fichas.zapato, monto: 100000, nombre: "Banco");

void showAlerta(String msg, BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) => mostrarAlerta(msg));
}

AlertDialog mostrarAlerta(String mensaje) {
  return AlertDialog(
    content: Text(mensaje),
  );
}

// ignore: non_constant_identifier_names
AppBar APPBAR = AppBar(title: const Text("Banco Electrónico"));

// ignore: non_constant_identifier_names
int DINEROINICIO = 70;
// ignore: non_constant_identifier_names
int PASARGO = 200;
// ignore: non_constant_identifier_names
int CARCEL = -50;
// ignore: non_constant_identifier_names
int UBICION = -50;

// ignore: non_constant_identifier_names
int TIEMPO_REGRESIVO = 3;

// ignore: non_constant_identifier_names
int MONTO_INICIAL = 20;

Color traductorColor(Colores color) {
  Color respuesta;

  switch (color) {
    case Colores.amarillo:
      respuesta = Colors.yellowAccent;
      break;
    case Colores.azul:
      respuesta = Colors.blue.shade900;
      break;
    case Colores.morado:
      respuesta = Colors.purple;
      break;
    case Colores.naranja:
      respuesta = Colors.orange;
      break;
    case Colores.rojo:
      respuesta = Colors.red;
      break;
    case Colores.marron:
      respuesta = Colors.brown;
      break;
    case Colores.verde:
      respuesta = Colors.green;
      break;
    case Colores.celeste:
      respuesta = Colors.blue;
      break;
    default:
      respuesta = Colors.pink;
      break;
  }

  return respuesta;
}
