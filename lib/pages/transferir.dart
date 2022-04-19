import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/pages/juego.dart';
import 'package:flutter/material.dart';

import '../models/enums/fichas.dart';

class Transferir extends StatefulWidget {
  final JuegoControlador juegoControlador;
  final int monto;

  const Transferir(
      {Key? key, required this.juegoControlador, required this.monto})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Transferir> createState() => _TransferirState(juegoControlador, monto);
}

class _TransferirState extends State<Transferir> {
  final JuegoControlador juegoControlador;
  final int monto;

  _TransferirState(this.juegoControlador, this.monto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            if (juegoControlador.transferir(monto)) {
              PUSH_AND_DELETE(
                  Juego(juegoControlador: juegoControlador), context);
              showAlerta("Transferencia exitosa", context);
            } else {
              showAlerta("Algo ha salido mal", context);
            }
          },
          child: const Icon(Icons.local_atm)),
      appBar: APPBAR(title: "Transferir $monto a ", transfer: true),
      body: ListView.builder(
          itemCount: juegoControlador.propietariosSinCheck().length,
          itemBuilder: (context, index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                child: CheckboxListTile(
                    activeColor: Colors.green,
                    controlAffinity: ListTileControlAffinity.platform,
                    value: juegoControlador
                        .propietariosSinCheck()[index]
                        .checkTransfer,
                    onChanged: (value) {
                      setState(() {
                        juegoControlador
                                .propietariosSinCheck()[index]
                                .checkTransfer =
                            !juegoControlador
                                .propietariosSinCheck()[index]
                                .checkTransfer;
                      });
                    },
                    secondary: traductorFicha(Fichas.values[index]),
                    title: Row(
                      children: [
                        Text(
                            '${juegoControlador.propietariosSinCheck()[index].nombre} monto: ${juegoControlador.propietariosSinCheck()[index].monto}')
                      ],
                    )),
              )),
    );
  }
}
