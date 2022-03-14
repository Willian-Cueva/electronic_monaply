import 'package:flutter/material.dart';
import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/models/Propiedad.dart';

class PropiedadWidget extends StatelessWidget {
  final Propiedad propiedad;

  const PropiedadWidget({Key? key, required this.propiedad}) : super(key: key);

  Widget _botones() {
    Widget w;
    if (propiedad.propietario.nombre == "Banco") {
      w = ElevatedButton(onPressed: () {}, child: Text("Comprar"));
    } else {
      w = Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("Pagar")),
          ElevatedButton(onPressed: () {}, child: Text("Vender"))
        ],
      );
    }
    return w;
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
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              propiedad.titulo,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Alquiler \$ ${propiedad.alquiler}"),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              "\$ ${propiedad.precio.toString()}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Text("Propietario: ${propiedad.propietario.nombre}"),
          Padding(padding: EdgeInsets.only(top: 10), child: _botones()),
        ],
      ),
    );
  }
}
