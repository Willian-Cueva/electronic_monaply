import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/pages/subasta.dart';
import 'package:electronic_monaply/pages/transaccion.dart';
import 'package:electronic_monaply/widgets/panel_button.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  final JuegoControlador juegoControlador;

  const Principal({Key? key, required this.juegoControlador}) : super(key: key);
  @override
  // ignore: no_logic_in_create_state
  State<Principal> createState() => _PrincipalState(juegoControlador);
}

class _PrincipalState extends State<Principal> {
  JuegoControlador juego;

  _PrincipalState(this.juego);
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
                  ventana: Subasta(juegoControlador: juego))
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
                  text: "Arca",
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
