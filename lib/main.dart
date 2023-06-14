import 'package:flutter/material.dart';
import 'package:flutter_udemy/gradient_container.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: GradientContainer.purple(),
      ),
    ),
  );
}
