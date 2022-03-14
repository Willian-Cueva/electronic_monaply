import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/JuegoControlador.dart';
import 'package:electronic_monaply/pages/transaccion.dart';
import 'package:electronic_monaply/widgets/panelButton.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  final int numeroJugadores;

  const Principal({Key? key, required this.numeroJugadores}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<Principal> createState() => _PrincipalState(numeroJugadores);
}

class _PrincipalState extends State<Principal> {
  int numeroJugadores;

  _PrincipalState(this.numeroJugadores);
  JuegoControlador juego = JuegoControlador(6);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: APPBAR,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PanelButton(
                  asset: "jail.png",
                  text: "Cárcel",
                  ventana: Transaccion(juegoControlador: juego)),
              PanelButton(
                  asset: "subasta.png",
                  text: "Subasta",
                  ventana: Transaccion(juegoControlador: juego))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PanelButton(
                  asset: "go.png",
                  text: "GO",
                  ventana: Transaccion(juegoControlador: juego)),
              PanelButton(
                  asset: "ubicacion.png",
                  text: "Ubicación",
                  ventana: Transaccion(juegoControlador: juego))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PanelButton(
                  asset: "cofre.png",
                  text: "Arca Comunal",
                  ventana: Transaccion(juegoControlador: juego)),
              PanelButton(
                  asset: "tarjeta.png",
                  text: "Propiedad",
                  ventana: Transaccion(juegoControlador: juego))
            ],
          ),
        ],
      ),
    );
  }
}
