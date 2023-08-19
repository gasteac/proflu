import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = randomizer.nextInt(6) + 1;
  var isRolling = false; // Estado que controla si los dados se están mostrando

  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
    });
  }

  void raandom() async {
    if (isRolling) return; // Evita iniciar otra animación si ya está en curso
    setState(() {
      isRolling = true; // Indicar que la animación está en curso
    });

    for (var i = 0; i < 5; i++) {
      rollDice();
      await Future.delayed(const Duration(milliseconds: 200));
    }

    setState(() {
      isRolling = false; // La animación ha terminado
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text("EL SUPER DADO",
            style: TextStyle(
                shadows: [
                  Shadow(
                      color: Color.fromARGB(255, 103, 93, 93),
                      offset: Offset(3, 3),
                      blurRadius: 10)
                ],
                color: Color.fromRGBO(241, 229, 0, 1),
                fontSize: 30,
                letterSpacing: 3,
                fontWeight: FontWeight.w800)),
        const Text("gasteac",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                letterSpacing: 3,
                fontWeight: FontWeight.w800)),
        const SizedBox(height: 60),
        const Text("El dado gira 5 veces",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                letterSpacing: 3,
                fontWeight: FontWeight.w800)),
        const Text("dsp hace pum y cae",
            style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                letterSpacing: 3,
                fontWeight: FontWeight.w800)),
        const SizedBox(height: 20),
        Image.asset("assets/images/dice-$currentDiceRoll.png",
            width: 200, height: 200),
        const SizedBox(height: 20),
        ElevatedButton(
            onPressed: isRolling
                ? null
                : raandom, // Desactivar el botón durante la animación
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.yellow,
                disabledBackgroundColor: Colors.black,
                textStyle: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3),
                backgroundColor: isRolling ? Colors.red : Colors.black),
            child: isRolling
                ? const Text("Girando", style: TextStyle(color: Colors.white))
                : const Text("Tirar", style: TextStyle(color: Colors.white))),
        const SizedBox(height: 20),
        isRolling
            ? const Text("girandooOooOoooO",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w800))
            : Text("El dado cayó en: $currentDiceRoll",
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 20,
                    letterSpacing: 3,
                    fontWeight: FontWeight.w800))
      ],
    );
  }
}
