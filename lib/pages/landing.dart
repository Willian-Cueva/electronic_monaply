import 'package:electronic_monaply/controllers/juegoControlador.dart';
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  // const Landing({Key? key}) : super(key: key);
  // Map propiedadesMap = jsonDecode('/assets/json/propiedades.json');
  // Fu

  // var propiedades =  Propiedad.fromJson();
  JuegoControlador juego = JuegoControlador();

  @override
  Widget build(BuildContext context) {
    // print();
    juego.cargarPropiedades();
    return Scaffold(
      appBar: AppBar(
        title: Text("Banco Electrónico"),
      ),
    );
  }
}
