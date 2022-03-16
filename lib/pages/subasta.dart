import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/models/enums/colores.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/scheduler.dart';

class Subasta extends StatefulWidget {
  final JuegoControlador juegoControlador;

  const Subasta({Key? key, required this.juegoControlador}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Subasta> createState() => _SubastaState(juegoControlador);
}

class _SubastaState extends State<Subasta> {
  final JuegoControlador juegoControlador;

  Timer? _timer;
  int _start = 10;
  int _monto = 20;

  bool _inicioConteo = false;
  bool _terminoConteo = false;

  _SubastaState(this.juegoControlador);

  void startTimer() {
    _inicioConteo = true;
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    } else {
      _timer = Timer.periodic(
        const Duration(seconds: 1),
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }
  }

  void cancelTimer() {
    _timer?.cancel();
    _start = 10;
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) => setState(
        () {
          if (_start < 1) {
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  ElevatedButton boton(Function()? funcion, String text) {
    return ElevatedButton(
        onPressed: funcion,
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ));
  }

  Widget _termino() {
    Widget res;
    if (_start == 0) {
      res = boton(() => {}, "Elegir Jugador");
    } else {
      if (!_inicioConteo) {
        res = boton(() => {startTimer()}, "Iniciar");
      } else {
        res = boton(() => {cancelTimer()}, "Subir Monto");
      }
    }
    return res;
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Subasta")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "\$ $_monto",
                style: TextStyle(
                    fontSize: 100, color: traductorColor(Colores.verde)),
              ),
              Text(
                "¡ En $_start !",
                style: const TextStyle(fontSize: 60),
              ),
              _termino(),
            ],
          ),
        ));
  }
}
