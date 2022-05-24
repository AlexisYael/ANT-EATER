// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'CreateUser.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Contiene la estructura básica de una aplicación
      appBar: AppBar(
        title: const Text("Ant - Eater"),
      ),
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  // ignore: avoid_unnecessary_containers
  return Container(
/*    decoration: const BoxDecoration( //Imágen de fondo.
        image: DecorationImage(
            image: NetworkImage(
                "https://www.solofondos.com/wp-content/uploads/2016/01/fondos-de-pantalla-hd-para-android-pokemon-576x1024.jpg"),
            fit: BoxFit.cover)),
*/
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        logo(),
        nombre(),
        campoUsuario(),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        campoContrasenia(),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        botonEntrar(),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        botonCrear(),
      ],
    )),
  );
}

Widget nombre() {
  return const Text(
    "Iniciar Sesión",
    style: TextStyle(
        color: Colors.blueGrey, fontSize: 35.0, fontWeight: FontWeight.bold),
  );
}

Widget logo() {
  return Image.asset(
    'images/Logo.png',
    height: 200.0,
  );
}

Widget campoUsuario() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.email),
          labelText: "Correo Electrónico",
          hintText: "ejemplo@correo.com",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoContrasenia() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: const TextField(
        obscureText: true,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.lock),
          labelText: "Contraseña",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget botonEntrar() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Colors.blueGrey,
          elevation: 15.0,
        ),
        onPressed: () {},
        child: const Text('Ingresar'),
      ),
    );
  });
}

Widget botonCrear() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return SizedBox(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
          primary: Colors.white,
          textStyle: const TextStyle(fontSize: 20),
          backgroundColor: Colors.blueGrey,
          elevation: 15.0,
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const CreateUser())));
        },
        child: const Text('Crear Cuenta'),
      ),
    );
  });
}
