import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/models/Propiedad.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class JuegoControlador {
  List<Propiedad> propiedades = [];

  // Future<ReqResPropiedad> _cargarPropiedades() async {
  //   var uri = Uri.parse(ASSETJSON + "propiedades.json");
  //   final respuesta = await http.get(uri);
  //   return reqResPropiedadesFromJson(respuesta.body);
  // }
  Future<void> cargarPropiedades() async {
    var uri = Uri.parse(ASSETJSON + "propiedades.json");
    final respuesta = await http.get(uri);
    print(respuesta.body);
  }

  // Future<void> presentar() async {
  //   AsyncSnapshot<ReqResPropiedad> snapshot = _cargarPropiedades();
  //   var s = snapshot.data!.Propiedades;
  // }
}
