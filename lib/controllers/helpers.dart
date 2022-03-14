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

// ignore: non_constant_identifier_names
AppBar APPBAR = AppBar(title: const Text("Banco Electrónico"));

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
