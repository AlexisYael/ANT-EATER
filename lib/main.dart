import 'package:flutter/material.dart';
import 'Login.dart';

void main() =>
    runApp(const MyApp()); //ejecuta el primer widget de la aplicación.

class MyApp extends StatelessWidget {
  //Constructor de widget con un MaterialApp "estilo de la aplicación"
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      title: "Ant Eater",
      home: const Inicio(), //Widget de inicio
    );
  }
}
