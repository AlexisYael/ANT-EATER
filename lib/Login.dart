// ignore_for_file: file_names

import 'package:ant_eater/Ingresos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'Welcome.dart';
import 'package:flutter/material.dart';
import 'CreateUser.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  TextEditingController correoCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  @override
  void dispose() {
    correoCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Contiene la estructura básica de una aplicación
        appBar: AppBar(
          title: const Text("Ant - Eater"),
        ),
        body: cuerpo(correoCtrl, passCtrl));
  }
}

Widget cuerpo(correoCtrl, passCtrl) {
  // ignore: avoid_unnecessary_containers
  return Container(
/*    decoration: const BoxDecoration( //Imágen de fondo.
        image: DecorationImage(
            image: NetworkImage(
                "https://www.solofondos.com/wp-content/uploads/2016/01/fondos-de-pantalla-hd-para-android-pokemon-576x1024.jpg"),
            fit: BoxFit.cover)),
*/
    child: Center(
        child: ListView(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        logo(),
        const SizedBox(
          height: 50,
        ),
        nombre(),
        campoUsuario(correoCtrl),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        campoContrasenia(passCtrl),
        // ignore: prefer_const_constructors
        SizedBox(
          height: 15,
        ),
        botonEntrar(correoCtrl, passCtrl),
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
  return const Center(
    child: Text(
      "Iniciar Sesión",
      style: TextStyle(
          color: Colors.blueGrey, fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
  );
}

Widget logo() {
  return Image.asset(
    'images/Logo.png',
    height: 200.0,
  );
}

Widget campoUsuario(correoCtrl) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: correoCtrl,
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

Widget campoContrasenia(passCtrl) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextField(
        controller: passCtrl,
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

Widget botonEntrar(correoCtrl, passCtrl) {
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
        onPressed: () async {
          //Funcion para leer de Firebase
          if (correoCtrl.text == "" || passCtrl.text == "") {
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
            String credencial = "";
            String pass = "";

            await db.collection("usuarios").get().then((event) {
              for (var doc in event.docs) {
                //print("${doc.id} => ${doc.data()}");
                if (doc.get("correo") == correoCtrl.text) {
                  credencial = doc.get("correo");
                  pass = doc.get("pass");
                  break;
                }
              }
            });

            if (credencial == "") {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content:
                      Text("El usuario ingresado no se encuentra registrado."),
                  actions: [
                    FlatButton(
                        child: Text("Ok"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ],
                ),
              );
            } else if (pass != passCtrl.text) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text("Error"),
                  content: Text("La contraseña no es correcta."),
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => Welcome(credencial))));
              //builder:
              //((context) => Ingresos());
            }
          } //else
        },
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
