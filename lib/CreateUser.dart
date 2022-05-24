// ignore_for_file: file_names

import 'package:ant_eater/Login.dart';
import 'package:flutter/material.dart';

class CreateUser extends StatelessWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Usuario"),
      ),
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  // ignore: avoid_unnecessary_containers
  return Container(
    child: Center(
        child: ListView(
      children: <Widget>[
        logo(),
        nombreRegistro(),
        const SizedBox(
          height: 15,
        ),
        campoNombre(),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        campoEdad(),
        const SizedBox(
          height: 15,
        ),
        campoUsuario(),
        const SizedBox(
          height: 15,
        ),
        campoContrasenia(),
        const SizedBox(
          height: 15,
        ),
        botonCrearCuenta(),
        const SizedBox(
          height: 15,
        ),
        botonRegresar(),
      ],
    )),
  );
}

Widget nombreRegistro() {
  return const Center(
    child: Text(
      "Registrar Cuenta",
      style: TextStyle(
          color: Colors.blueGrey, fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget campoNombre() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const TextField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          icon: Icon(Icons.person),
          labelText: "Nombre",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoEdad() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: const TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.cake),
          labelText: "Edad",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget botonCrearCuenta() {
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
        child: const Text('Crear'),
      ),
    );
  });
}

Widget botonRegresar() {
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
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const Inicio())));
        },
        child: const Text('Regresar'),
      ),
    );
  });
}

//ESTO ES UNA PRUEBA
