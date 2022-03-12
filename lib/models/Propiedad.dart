import 'package:electronic_monaply/models/Propietario.dart';

import 'enums/colores.dart';

class Propiedad {
    Propiedad({
        required this.id,
        required this.color,
        required this.titulo,
        required this.alquiler,
        required this.unaCasa,
        required this.dosCasa,
        required this.tresCasa,
        required this.cuatroCasa,
        required this.hotel,
        required this.valorHipotecable,
        required this.valorCasa,
        required this.valorHotel,
        required this.precio,
        required this.propietario,
    });

    int id;
    Colores color;
    String titulo;
    int alquiler;
    int unaCasa;
    int dosCasa;
    int tresCasa;
    int cuatroCasa;
    int hotel;
    int valorHipotecable;
    int valorCasa;
    int valorHotel;
    int precio;
    Propietario propietario;

    
}

