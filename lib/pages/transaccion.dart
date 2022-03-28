import 'package:flutter/material.dart';
import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/juego_controlador.dart';
import 'package:electronic_monaply/widgets/propiedad_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Transaccion extends StatelessWidget {
  final JuegoControlador juegoControlador;
  const Transaccion({Key? key, required this.juegoControlador})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: APPBAR,
      body: Center(
        child: CarouselSlider(
            options: CarouselOptions(
                enableInfiniteScroll: false, autoPlay: true, height: 275),
            items: juegoControlador.propiedades
                .map((e) => PropiedadWidget(
                      propiedad: e,
                      juegoControlador: juegoControlador,
                      context: context,
                    ))
                .toList()),
      ),
    );
  }
}
