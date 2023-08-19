import "package:flutter/material.dart";
import 'package:proflu/gradient_container.dart';
// import 'gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(Color.fromARGB(255, 92, 200, 210),
            Color.fromARGB(255, 43, 223, 157)),
      ),
    ),
  );
}
