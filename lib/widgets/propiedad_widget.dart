import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/pages/pagar.dart';
import 'package:flutter/material.dart';
import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/models/propiedad.dart';

class PropiedadWidget extends StatelessWidget {
  final Propiedad propiedad;
  final JuegoControlador juegoControlador;
  final BuildContext context;

  const PropiedadWidget(
      {Key? key,
      required this.propiedad,
      required this.juegoControlador,
      required this.context})
      : super(key: key);

  Widget _botones() {
    Widget w;
    if (propiedad.propietario.nombre == "Banco") {
      w = ElevatedButton(
          onPressed: () async {
            await _asyncComprar(context, juegoControlador);
          },
          child: const Text("Comprar"));
    } else {
      final String condicionCasa = propiedad.numeroCasas < 5 ? 'Casa' : 'Hotel';
      w = Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await _asyncElegirJugador(context, juegoControlador);
                  },
                  child: const Text("Pagar")),
              ElevatedButton(onPressed: () {}, child: const Text("Vender"))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (juegoControlador.comprarCasa(
                    propiedad, propiedad.propietario)) {
                  Navigator.pop(context);
                  showAlerta("Casa o Hotel adquirido exitosamente", context);
                } else {
                  showAlerta(
                      "Dinero Insuficiente o Límite de mejoras alcanzado",
                      context);
                }
              },
              child: Text("Comprar $condicionCasa")),
        ],
      );
    }
    return w;
  }

  Future<void> _asyncElegirJugador(
      BuildContext context, JuegoControlador juegoControlador) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Selecciona el Jugador'),
            children: juegoControlador
                .getParticipantes()
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            if (juegoControlador
                                .pasarPorPropiedadConPropietario(
                                    e, propiedad)) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              showAlerta(
                                  "Casa comprada exitosamente :D", context);
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Pagar(
                                        juegoControlador: juegoControlador, propietario: e,),
                              );
                              showAlerta(
                                  "Dinero Insuficiente :( jajajaj o ha ocurrido un error :[",
                                  context);
                            }
                          },
                          child: Text(e.nombre)),
                    ))
                .toList(),
          );
        });
  }

  Future<void> _asyncComprar(
      BuildContext context, JuegoControlador juegoControlador) async {
    return await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: const Text('Selecciona el Jugador'),
            children: juegoControlador
                .getParticipantes()
                .map((e) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                          onPressed: () {
                            if (juegoControlador.comprarPropiedad(
                                propiedad, e)) {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              showAlerta(
                                  "Casa comprada exitosamente :D", context);
                            } else {
                              showAlerta(
                                  "Dinero Insuficiente :( jajajaj", context);
                            }
                          },
                          child: Text(e.nombre)),
                    ))
                .toList(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: traductorColor(propiedad.color),
                borderRadius: BorderRadius.circular(5)),
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              propiedad.titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Alquiler \$ ${propiedad.alquiler}"),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "\$ ${propiedad.precio.toString()}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Propietario: ${propiedad.propietario.nombre}"),
          Padding(padding: const EdgeInsets.only(top: 10), child: _botones()),
        ],
      ),
    );
  }
}
