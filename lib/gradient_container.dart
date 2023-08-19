import "package:flutter/material.dart";
import 'package:proflu/dice_roller.dart';

//botonsito
const bc1 = Color.fromARGB(255, 118, 206, 196);
const bc2 = Color.fromARGB(255, 255, 255, 255);
//gradiente
const alInicio = Alignment.topRight;
const alFinal = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, {super.key});

  const GradientContainer.purple({super.key})
      : color1 = Colors.deepPurple,
        color2 = Colors.purpleAccent;

  final Color color1;
  final Color color2;

  @override
  Widget build(context) {
    return Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color1, color2],
            begin: alInicio,
            end: alFinal,
          ),
        ),
        child: const Center(
          child: DiceRoller(),
        ));
  }
}
