import 'dart:convert';

ReqResPropiedad reqResPropiedadesFromJson(String str) => ReqResPropiedad.fromJson(json.decode(str));

String reqResPropiedadesToJson(ReqResPropiedad data) => json.encode(data.toJson());

class ReqResPropiedad {
    ReqResPropiedad({
        required this.Propiedades,
    });

    List<Propiedad> Propiedades;

    factory ReqResPropiedad.fromJson(Map<String, dynamic> json) => ReqResPropiedad(
        Propiedades: List<Propiedad>.from(json["Propiedades"].map((x) => Propiedad.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "Propiedades": List<dynamic>.from(Propiedades.map((x) => x.toJson())),
    };
}

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
        required this.idPropietario,
    });

    int id;
    String color;
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
    int idPropietario;

    factory Propiedad.fromJson(Map<String, dynamic> json) => Propiedad(
        id: json["id"],
        color: json["color"],
        titulo: json["titulo"],
        alquiler: json["alquiler"],
        unaCasa: json["unaCasa"],
        dosCasa: json["dosCasa"],
        tresCasa: json["tresCasa"],
        cuatroCasa: json["cuatroCasa"],
        hotel: json["hotel"],
        valorHipotecable: json["valorHipotecable"],
        valorCasa: json["valorCasa"],
        valorHotel: json["valorHotel"],
        precio: json["precio"],
        idPropietario:json["idPropietario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "color": color,
        "titulo": titulo,
        "alquiler": alquiler,
        "unaCasa": unaCasa,
        "dosCasa": dosCasa,
        "tresCasa": tresCasa,
        "cuatroCasa": cuatroCasa,
        "hotel": hotel,
        "valorHipotecable": valorHipotecable,
        "valorCasa": valorCasa,
        "valorHotel": valorHotel,
        "precio": precio,
        "propietario": idPropietario,
    };
}

