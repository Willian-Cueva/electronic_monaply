import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:flutter/material.dart';

class Accion extends StatelessWidget {
  final BuildContext context;
  final String title;
  final int valor;
  final JuegoControlador juegoControlador;

  const Accion(
      {Key? key,
      required this.valor,
      required this.context,
      required this.title,
      required this.juegoControlador})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
              itemCount: juegoControlador.getParticipantes().length,
              itemBuilder: (context, index) {
                return ElevatedButton(
                    onPressed: () {
                      if (juegoControlador.pagar(
                          valor, juegoControlador.getParticipantes()[index])) {
                        Navigator.pop(context);
                        showAlerta("Transacción Exitosa", context);
                      } else {
                        showAlerta("Dinero Insuficiente", context);
                      }
                    },
                    child: Text(
                        juegoControlador.getParticipantes()[index].nombre));
              }),
        ),
      ),
    );
  }
}
