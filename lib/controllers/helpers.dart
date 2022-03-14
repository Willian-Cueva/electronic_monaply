// ignore: constant_identifier_names
import 'package:electronic_monaply/models/Propietario.dart';
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
  
  return Colors.black;
}
