import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/models/propietario.dart';
import 'package:flutter/material.dart';

class PropietarioWidget extends StatelessWidget {
  final JuegoControlador juegoControlador;
  final Propietario propietario;

  const PropietarioWidget(
      {Key? key, required this.propietario, required this.juegoControlador})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              propietario.nombre,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            "Número Propiedades ${juegoControlador.getPropiedadesDeUnPropietario(propietario).length}",
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "Monto \$ ${propietario.monto}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
            ),
          ),
        ],
      ),
    );
  }
}
