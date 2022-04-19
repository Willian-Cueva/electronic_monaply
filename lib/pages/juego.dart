import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/models/enums/fichas.dart';
import 'package:electronic_monaply/pages/transferir.dart';
import 'package:flutter/material.dart';

class Juego extends StatefulWidget {
  final JuegoControlador juegoControlador;

  const Juego({required this.juegoControlador});

  @override
  // ignore: no_logic_in_create_state
  State<Juego> createState() => _JuegoState(juegoControlador);
}

class _JuegoState extends State<Juego> {
  final JuegoControlador juegoControlador;
  _JuegoState(this.juegoControlador);
  int monto = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _elegirMonto();
          },
          child: const Icon(Icons.paid)),
      appBar: APPBAR(),
      body: ListView.builder(
          itemCount: juegoControlador.propietarios.length,
          itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.platform,
                    value: juegoControlador.propietarios[index].check,
                    onChanged: (value) {
                      setState(() {
                        juegoControlador.propietarios[index].check =
                            !juegoControlador.propietarios[index].check;
                      });
                    },
                    secondary: traductorFicha(Fichas.values[index]),
                    title: Row(
                      children: [
                        Text(
                            '${juegoControlador.propietarios[index].nombre} monto: ${juegoControlador.propietarios[index].monto}')
                      ],
                    )),
              )),
    );
  }

  void _elegirMonto() {
    List<TextButton> opciones = [
      TextButton(
          onPressed: () {
            Navigator.pop(context);
            if (monto > 0) {
              PUSH_AND_DELETE(
                  Transferir(juegoControlador: juegoControlador, monto: monto),
                  context);
            } else {
              showAlerta("El monto debe ser positivo", context);
            }
          },
          child: const Text("Aceptar")),
    ];

    AlertDialog alerta = AlertDialog(
      title: const Text("Monto a tránsferir"),
      content: TextField(
        keyboardType: TextInputType.number,
        maxLength: 3,
        autofocus: true,
        onChanged: (String input) {
          setState(() {
            monto = int.parse(input);
          });
        },
      ),
      actions: opciones,
      // content: ,
    );
    showDialog(context: context, builder: (BuildContext context) => alerta);
  }
}
