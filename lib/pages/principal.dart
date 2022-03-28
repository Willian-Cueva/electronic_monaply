import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/pages/accion.dart';
import 'package:electronic_monaply/pages/detalles.dart';
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
      appBar: AppBar(
        title: const Text("Banco Electrónico"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Detalles(juegoControlador: juego, context: context)),
                );
              },
              icon: const Icon(Icons.info))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PanelButton(
                  asset: "jail.png",
                  text: "Cárcel",
                  ventana: Accion(
                      valor: CARCEL,
                      context: context,
                      title: "Salir de la Cárcel",
                      juegoControlador: juego)),
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
                  ventana: Accion(
                      valor: PASARGO,
                      context: context,
                      title: "Pasó por GO",
                      juegoControlador: juego)),
              PanelButton(
                  asset: "ubicacion.png",
                  text: "Ubicación",
                  ventana: Accion(
                      valor: UBICION,
                      context: context,
                      title: "Ubicación",
                      juegoControlador: juego))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              PanelButton(
                  asset: "cofre.png",
                  text: "Chance",
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
