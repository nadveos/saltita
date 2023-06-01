import 'dart:math';

import 'package:flutter/material.dart';

class Fondo extends StatelessWidget {
  const Fondo({super.key});

  @override
  Widget build(BuildContext context) {
    return _fondo();
  }

  Widget _fondo() {
    final gradiente = Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset(0.0, 0.6),
              end: FractionalOffset(0.0, 1.0),
              colors: [
            Color.fromRGBO(52, 54, 101, 1.0),
            Color.fromRGBO(35, 37, 57, 1.0)
          ])),
    );

    final cajita = Transform.rotate(
      angle: -pi / 5.0,
      child: Container(
        width: 360.0,
        height: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(80.0),
            gradient: const LinearGradient(colors: [
              Color.fromRGBO(236, 98, 165, 1),
              Color.fromRGBO(241, 142, 172, 1.0)
            ])),
      ),
    );

    return Stack(
      children: [gradiente, Positioned(top: -130.0, child: cajita)],
    );
  }
}
