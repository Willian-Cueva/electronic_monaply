import 'package:electronic_monaply/widgets/propietario_widget.dart';
import 'package:flutter/material.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';

class Detalles extends StatelessWidget {
  final JuegoControlador juegoControlador;
  final BuildContext context;

  const Detalles(
      {Key? key, required this.juegoControlador, required this.context})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Detalle de Jugadores"),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
            itemCount: juegoControlador.getParticipantes().length,
            itemBuilder: (context, index) {
              return PropietarioWidget(
                  propietario: juegoControlador.getParticipantes()[index],
                  juegoControlador: juegoControlador);
            }),
      )),
    );
  }
}
