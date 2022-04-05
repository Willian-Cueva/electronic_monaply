import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/models/enums/colores.dart';
import 'package:electronic_monaply/models/propietario.dart';
import 'package:flutter/material.dart';
import 'dart:async';

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
  int _start = TIEMPO_REGRESIVO;
  int _monto = MONTO_INICIAL;

  bool _inicioConteo = false;

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
    _start = TIEMPO_REGRESIVO;
    _monto += 20;
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
      res = boton(() async {
        _elegirJugador(context, juegoControlador);
      }, "Elegir Jugador");
    } else {
      if (!_inicioConteo) {
        res = boton(() => {startTimer()}, "Iniciar");
      } else {
        res = boton(() => {cancelTimer()}, "Subir Monto");
      }
    }
    return res;
  }

  Future<void> _elegirJugador(
      BuildContext context, JuegoControlador juegoControlador) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Selecciona el Jugador'),
            children: juegoControlador.getParticipantes()
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          onPressed: () async {
                            await _asyncComprar(context, e);
                          },
                          child: Text(e.nombre)),
                    ))
                .toList(),
          );
        });
  }

  Future<void> _asyncComprar(
      BuildContext context, Propietario propietario) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Selecciona una Propiedad'),
            children: juegoControlador
                .propiedadesSinComprar()
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            if (!juegoControlador.compraPropiedadSubasta(
                                _monto, propietario, e)) {
                              showAlerta(
                                  "Dinero Insuficiente :'v, jajajaj", context);
                            } else {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              Navigator.pop(context);
                              showAlerta(
                                  "Casa Comprada Satisfactoriamente", context);
                            }
                          },
                          child: Text(e.titulo)),
                    ))
                .toList(),
          );
        });
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
