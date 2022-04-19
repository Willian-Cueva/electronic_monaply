// ignore: constant_identifier_names
import 'package:electronic_monaply/models/propietario.dart';
import 'package:electronic_monaply/models/enums/colores.dart';
import 'package:electronic_monaply/models/enums/fichas.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const ASSETJSON = "assets/json/";

// ignore: non_constant_identifier_names
Propietario BANCO = Propietario(
    id: 0,
    ficha: Fichas.zapato,
    monto: 100000,
    nombre: "Banco",
    check: false,
    checkTransfer: false);

// Esta funcion nos sirve para llamar solamente un mensaje en pantalla
void showAlerta(String msg, BuildContext context) {
  showDialog(
      context: context, builder: (BuildContext context) => _mostrarAlerta(msg));
}

AlertDialog _mostrarAlerta(String mensaje) {
  return AlertDialog(
    content: Text(mensaje),
  );
}

// ignore: non_constant_identifier_names
AppBar APPBAR({String title = "Banco Electrónico", bool transfer = false}) =>
    AppBar(
      title: Text(title),
      backgroundColor: transfer ? Colors.green : Colors.blue,
    );

// ignore: non_constant_identifier_names
int DINEROINICIO = 62;
// ignore: non_constant_identifier_names
int PASARGO = 200;
// ignore: non_constant_identifier_names
int CARCEL = -50;
// ignore: non_constant_identifier_names
int UBICION = -50;

// ignore: non_constant_identifier_names
int TIEMPO_REGRESIVO = 5;

// ignore: non_constant_identifier_names
int MONTO_INICIAL = 1500;

List<String> iniciarListaNombres(int numeroJugadores) {
  List<String> nombres = [];
  for (var i = 0; i < numeroJugadores; i++) {
    nombres.add("Jugador ${i + 1}");
  }
  return nombres;
}

// ignore: non_constant_identifier_names
void PUSH_AND_DELETE(Widget ventana, BuildContext context) {
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => ventana),
      (Route<dynamic> route) => false);
}

Icon traductorFicha(Fichas ficha) {
  Icon icono = const Icon(Icons.abc);
  switch (ficha) {
    case Fichas.sombrero:
      icono = const Icon(Icons.account_balance);
      break;
    case Fichas.barco:
      icono = const Icon(Icons.sailing);
      break;
    case Fichas.carro:
      icono = const Icon(Icons.directions_car);
      break;
    case Fichas.avion:
      icono = const Icon(Icons.airplanemode_active);
      break;
    case Fichas.perro:
      icono = const Icon(Icons.pets);
      break;
    case Fichas.zapato:
      icono = const Icon(Icons.ice_skating);
      break;
    case Fichas.carreta:
      icono = const Icon(Icons.shopping_cart);
      break;
    default:
  }
  return icono;
}

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
