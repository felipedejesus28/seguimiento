import 'package:flutter/material.dart';
import 'package:seguimiento/principal.dart';
import 'package:seguimiento/signoscapturar.dart';
import 'package:seguimiento/signosmostrar.dart';


main() => runApp(Estructura());

class Estructura extends StatefulWidget {
  @override
  createState() => Estado();
}

class Estado extends State<Estructura> {
  @override
  Widget build(BuildContext context) => MaterialApp(

    initialRoute: 'signoscapturar',

    routes: {
      'principal': (context) => Principal(),
      'signoscapturar': (context) => SignosCapturar(),
      'signosmostrar': (context)=>SignosMostrar(),


    },

  );
}