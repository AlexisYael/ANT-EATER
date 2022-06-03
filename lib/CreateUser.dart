// ignore_for_file: file_names, depend_on_referenced_packages, avoid_print

import 'package:ant_eater/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class CreateUser extends StatefulWidget {
  const CreateUser({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CreateUser createState() => _CreateUser();
}

class _CreateUser extends State<CreateUser> {
  //final myController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController edadController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    //  myController.dispose();
    nombreController.dispose();
    edadController.dispose();
    correoController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Usuario"),
      ),
      body: cuerpo(
          nombreController, edadController, correoController, passController),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(nombreController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}

Widget cuerpo(
    nombreController, edadController, correoController, passController) {
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
        campoNombre(nombreController),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        campoEdad(edadController),
        const SizedBox(
          height: 15,
        ),
        campoUsuario2(correoController),
        const SizedBox(
          height: 15,
        ),
        campoContrasenia2(passController),
        const SizedBox(
          height: 15,
        ),
        botonCrearCuenta(
            nombreController, edadController, correoController, passController),
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

Widget campoNombre(nombreController) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: nombreController,
        keyboardType: TextInputType.name,
        decoration: const InputDecoration(
          icon: Icon(Icons.person),
          labelText: "Nombre",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoEdad(edadController) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextField(
        controller: edadController,
        keyboardType: TextInputType.number,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          icon: const Icon(Icons.cake),
          labelText: "Edad",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoUsuario2(correoController) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: correoController,
        keyboardType: TextInputType.emailAddress,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          icon: const Icon(Icons.email),
          labelText: "Correo Electrónico",
          hintText: "ejemplo@correo.com",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoContrasenia2(passController) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: passController,
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        // ignore: prefer_const_constructors
        decoration: InputDecoration(
          icon: const Icon(Icons.lock),
          labelText: "Contraseña",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget botonCrearCuenta(
    nombreController, edadController, correoController, passController) {
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
          if (nombreController.text == "" ||
              edadController.text == "" ||
              correoController == "" ||
              passController == "") {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Atención"),
                content: Text(
                    "Por favor, ingrese la información en todos los campos."),
                actions: [
                  FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        Navigator.of(context).pop();
                      })
                ],
              ),
            );
          } else {
            final user = <String, dynamic>{
              "nombre": nombreController.text,
              "edad": edadController.text,
              "correo": correoController.text,
              "pass": passController.text
            };
            db.collection("usuarios").add(user).then((DocumentReference doc) =>
                print('DocumentSnapshot added with ID: ${doc.id}'));

            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => const Inicio())));
          }
        },
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
