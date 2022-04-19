import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/pages/juego.dart';
import 'package:flutter/material.dart';

class Nombres extends StatefulWidget {
  final List<String> nombres;

  const Nombres({Key? key, required this.nombres}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<Nombres> createState() => _NombresState(nombres);
}

class _NombresState extends State<Nombres> {
  final List<String> nombres;

  // Widget inputNombre(int index){
  //   return ;
  // }

  _NombresState(this.nombres);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: APPBAR(title: "Participantes"),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Juego(juegoControlador: JuegoControlador(nombres))),
          );
        },
      ),
      body: ListView.builder(
          itemCount: nombres.length,
          itemBuilder: (BuildContext context, int index) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: nombres[index],
                  ),
                  onChanged: (String input) {
                    setState(() {
                      nombres[index] = input;
                    });
                  },
                ),
              )),
    );
  }
}
