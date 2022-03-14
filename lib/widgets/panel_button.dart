import 'package:flutter/material.dart';

class PanelButton extends StatelessWidget {
  final String asset;
  final String text;
  final Widget ventana;

  const PanelButton(
      {Key? key,
      required this.asset,
      required this.text,
      required this.ventana})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ventana),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset('assets/images/' + asset),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16),
              ),
            )
          ]),
        ));
  }
}
