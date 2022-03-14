import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/models/Propiedad.dart';
import 'package:flutter/material.dart';

class PropiedadWidget extends StatelessWidget {
  final Propiedad propiedad;

  const PropiedadWidget({Key? key, required this.propiedad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: ElevatedButton(
            child: Column(
              children: [
                Container(
                  color: traductorColor(propiedad.color),
                  height: 5,
                )
              ],
            ),
            onPressed: () {}));
  }
}
