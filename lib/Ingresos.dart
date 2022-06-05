// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'CreateUser.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class Ingresos extends StatefulWidget {
  String usuario;
  Ingresos(this.usuario);
  //const Ingresos({Key? key}) : super(key: key);

  @override
  State<Ingresos> createState() => _IngresosState();
}

class _IngresosState extends State<Ingresos> {
  TextEditingController ingresoCtrl = TextEditingController();

  @override
  void dispose() {
    ingresoCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //return Scaffold(body: cuerpo(ingresoCtrl, widget.usuario));
    return Scaffold(body: cuerpo(ingresoCtrl, widget.usuario));
  }
}

Widget cuerpo(ingresoCtrl, usuario) {
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
        campoIngreso(ingresoCtrl),
        const SizedBox(
          height: 15,
        ),
        botonAgregarIn(ingresoCtrl, usuario),
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

Widget campoIngreso(ingresoCtrl) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextField(
        controller: ingresoCtrl,
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

Widget botonAgregarIn(ingresoCtrl, usuario) {
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
          if (ingresoCtrl.text == "") {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Atención"),
                content: Text("No ha ingresado un valor válido."),
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
            final ingreso = <String, dynamic>{
              "usuario": usuario,
              "valor": ingresoCtrl.text
            };
            db.collection("ingresos").add(ingreso).then(
                (DocumentReference doc) =>
                    print('INGRESO added with ID: ${doc.id}'));

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("CORRECTO"),
                content: Text("Se ha registrado el ingreso."),
                actions: [
                  FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        ingresoCtrl.clear();
                        Navigator.of(context).pop();
                      })
                ],
              ),
            );
          }
        },
        child: const Text('Agregar Ingreso'),
      ),
    );
  });
}
