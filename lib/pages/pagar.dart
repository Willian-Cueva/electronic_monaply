// import 'package:electronic_monaply/models/Propiedad.dart';
import 'package:electronic_monaply/models/Propietario.dart';
import 'package:flutter/material.dart';
import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
// import 'package:electronic_monaply/widgets/propiedad_widget.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class Pagar extends StatelessWidget {
  final JuegoControlador juegoControlador;
  // final Propiedad propiedad;
  final Propietario propietario;

  const Pagar({Key? key,required this.juegoControlador,required this.propietario}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: APPBAR,
        body: Center(
            child: ElevatedButton(
                onPressed: () {
                  propietario.monto += 100;
                },
                child: Text(
                    "Monto del ${propietario.nombre}: ${propietario.monto}")))
        // child: CarouselSlider(
        //     options: CarouselOptions(
        //         enableInfiniteScroll: false, autoPlay: true, height: 275),
        //     items: juegoControlador.propiedades
        //         .map((e) => PropiedadWidget(
        //               propiedad: e,
        //               juegoControlador: juegoControlador,
        //               context: context,
        //             ))
        //
        );
  }
}
