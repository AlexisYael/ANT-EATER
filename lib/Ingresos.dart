// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Ingresos extends StatefulWidget {
  const Ingresos({Key? key}) : super(key: key);

  @override
  State<Ingresos> createState() => _IngresosState();
}

class _IngresosState extends State<Ingresos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: cuerpo());
  }
}

Widget cuerpo() {
  return Container(
    child: Center(
        child: ListView(
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        tituloIngresos(),
        const SizedBox(
          height: 20,
        ),
        campoIngreso(),
        const SizedBox(
          height: 15,
        ),
        botonAgregarIn(),
      ],
    )),
  );
}

Widget tituloIngresos() {
  return const Center(
    child: Text(
      "INGRESOS",
      style: TextStyle(
          color: Colors.blueGrey, fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget campoIngreso() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: const TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.monetization_on_outlined),
          labelText: "Ingresos",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget botonAgregarIn() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(10.0),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Colors.blueGrey,
          elevation: 15.0,
        ),
        onPressed: () {},
        child: const Text('Agregar Ingreso'),
      ),
    );
  });
}
