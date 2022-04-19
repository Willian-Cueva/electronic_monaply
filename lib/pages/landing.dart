import 'package:electronic_monaply/controllers/helpers.dart';
import 'package:electronic_monaply/pages/nombres.dart';
import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LandingState();
  }
}

class MiStep extends Step {
  MiStep(String title, Widget contenido)
      : super(
            title: Text(
              title,
              style: const TextStyle(color: Colors.orange, fontSize: 20),
            ),
            content: contenido);
}

class LandingState extends State<Landing> {
  // ignore: non_constant_identifier_names
  int _ActualStep = 0;

  int _numeroJugadores = 0;

  AlertDialog _mostrarAlerta(String mensaje) {
    return AlertDialog(
      content: Text(mensaje),
    );
  }

  void enCambio(int valor) {
    setState(() {
      _numeroJugadores = valor;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Step> misSteps = [
      MiStep(
          "¿Cuántos Jugadores Hay?",
          TextFormField(
            keyboardType: TextInputType.number,
            onChanged: (String valor) {
              enCambio(int.parse(valor==""?"0":valor));
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Por favor ingrese un número';
              }
              if (int.parse(value) < 2 || int.parse(value) > 6) {
                return 'El numero debe estar entre 2 y 6';
              }
              return null;
            },
          )),
    ];
    return Scaffold(
      appBar: APPBAR(),
      body: Center(
        child: Stepper(
          steps: misSteps,
          currentStep: _ActualStep,
          type: StepperType.vertical,
          onStepCancel: () {
            debugPrint("El paso actual es " + (_ActualStep - 1).toString());
            setState(() {
              if (_ActualStep != 0) {
                _ActualStep--;
              } else {
                showDialog(
                    context: context,
                    // child: _mostrarAlerta("Es el principio de los Landing"));
                    builder: (BuildContext context) =>
                        _mostrarAlerta("Es el principio de los Landing"));
              }
            });
          },
          onStepTapped: (step) {
            setState(() {
              _ActualStep = step;
            });
          },
          onStepContinue: () {
            setState(() {
              if (_ActualStep + 1 < misSteps.length) {
                ++_ActualStep;
              } else {
                // ignore: unnecessary_null_comparison
                if (_numeroJugadores == null) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => _mostrarAlerta(
                          "Debe Ingresar el número de jugadores"));
                } else if (_numeroJugadores < 2 || _numeroJugadores > 6) {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _mostrarAlerta("El número debe estar entre 2 y 6"));
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Nombres(
                            nombres: iniciarListaNombres(_numeroJugadores))),
                  );
                }
              }
            });
          },
        ),
      ),
    );
  }
}
