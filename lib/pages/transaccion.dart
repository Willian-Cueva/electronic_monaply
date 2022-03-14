import 'package:carousel_slider/carousel_slider.dart';
import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/controllers/JuegoControlador.dart';
import 'package:electronic_monaply/widgets/PropiedadWidget.dart';
import 'package:flutter/material.dart';

class Transaccion extends StatelessWidget {
  final JuegoControlador juegoControlador;

  const Transaccion({Key? key, required this.juegoControlador})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: APPBAR,
      body: Center(
        child: CarouselSlider(
            options: CarouselOptions(
              height: 400,
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: juegoControlador.propiedades
                .map((e) => PropiedadWidget(propiedad: e))
                .toList()),
      ),
    );
  }
}
