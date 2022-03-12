import 'package:flutter/material.dart';

class Landing extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LandingState();
  }
}

class MiStep extends Step {
  MiStep(String title, Widget contenido)
      : super(
            title: Text(
              title,
              style: TextStyle(color: Colors.orange, fontSize: 20),
            ),
            content: contenido);
}

class LandingState extends State<Landing> {
  int _ActualStep = 0;

  List<String> nombres = [];

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
    // TODO: implement build
    List<Step> misSteps = [
    MiStep(
        "¿Cuántos Jugadores Hay?",
        TextFormField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(hintText: "2"),
          onChanged: (String valor) {
            enCambio(int.parse(valor));
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Por favor ingrese un número';
            }
            if (int.parse(value) < 2 || int.parse(value) >= 6) {
              return 'El numero debe estar entre 2 y 6';
            }
            return null;
          },
        )),
    MiStep("Ingrese el nombre de los Jugadores", ListView.builder(itemBuilder: _numeroJugadores)),
  ];
    return Scaffold(
      appBar: AppBar(title: const Text("Banco Electrónico")),
      body: Center(
        child: Stepper(
          steps: misSteps,
          currentStep: _ActualStep,
          type: StepperType.vertical,
          onStepCancel: () {
            print("El paso actual es " + (_ActualStep - 1).toString());
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _mostrarAlerta("FIn de los Landing"));
              }
            });
          },
        ),
      ),
    );
  }
}

