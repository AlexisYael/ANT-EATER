// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'dart:developer';
import 'package:ant_eater/Ingresos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class Egresos extends StatefulWidget {
  //const Egresos({Key? key}) : super(key: key);
  String usuario;
  Egresos(this.usuario);

  @override
  State<Egresos> createState() => _EgresosState();
}

class _EgresosState extends State<Egresos> {
  TextEditingController eg_desc_Ctrl = TextEditingController();
  TextEditingController eg_cant_Ctrl = TextEditingController();
  TextEditingController eg_prec_Ctrl = TextEditingController();
  TextEditingController eg_total_Ctrl = TextEditingController();
  //Crear variable donde indicarĂ¡ el valor actual DropDownButton
  String dropDownCurrentValue = "Alimentos";

  @override
  void dispose() {
    eg_desc_Ctrl.dispose();
    eg_cant_Ctrl.dispose();
    eg_prec_Ctrl.dispose();
    eg_total_Ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //body: cuerpo(eg_desc_Ctrl, eg_cant_Ctrl, eg_prec_Ctrl, eg_total_Ctrl,widget.usuario),
        body: Container(
      child: Center(
          child: ListView(
        children: <Widget>[
          const SizedBox(
            height: 100,
          ),
          titulo(),
          const SizedBox(
            height: 20,
          ),
//EMpieza codigo para dropdownbutton

          DropdownButton(
              items: [
                'Alimentos',
                'Gastos Escolares',
                'Transporte',
                'Servicios',
                'Gastos Medicos',
                'Entretenimiento',
                'Otros'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
              isExpanded: true,
              dropdownColor: Colors.white,
              //hint: Text(selectedValue),
              icon: Icon(Icons.arrow_drop_down_circle_rounded),
              value: dropDownCurrentValue,
              onChanged: (String? valueIn) {
                setState(() {
                  dropDownCurrentValue = valueIn.toString();
                });
              }),
//Termina codigo para dropdownButton
          const SizedBox(
            height: 15,
          ),
          campoDescripcion(eg_desc_Ctrl),
          const SizedBox(
            height: 15,
          ),
          campoCantidad(eg_cant_Ctrl),
          const SizedBox(
            height: 15,
          ),
          campoPrecio(eg_prec_Ctrl),
          const SizedBox(
            height: 15,
          ),
          campoTotal(eg_total_Ctrl),
          const SizedBox(
            height: 15,
          ),
          botonAgregar(dropDownCurrentValue, eg_desc_Ctrl, eg_cant_Ctrl,
              eg_prec_Ctrl, eg_total_Ctrl, widget.usuario),
        ],
      )),

/*
          child: DropdownButton(
              items: ["OpciĂ³n 1", "OpciĂ³n 2", "OpciĂ³n 3"]
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              isExpanded: true,
              dropdownColor: Colors.white,
              //hint: Text(selectedValue),
              icon: Icon(Icons.arrow_drop_down_circle_rounded),
              value: dropDownCurrentValue,
              onChanged: (String? valueIn) {
                setState(() {
                  dropDownCurrentValue = valueIn.toString();
                });
              }),
*/
    ));
  }
}

//WIDGET CUERPO ORIGINAL
/*Widget cuerpo(
    eg_desc_Ctrl, eg_cant_Ctrl, eg_prec_Ctrl, eg_total_Ctrl, usuario) {
  return Container(
    child: Center(
        child: ListView(
      children: <Widget>[
        const SizedBox(
          height: 100,
        ),
        titulo(),
        const SizedBox(
          height: 20,
        ),
//EMpieza codigo para dropdownbutton

        //   categoria(),

//Termina codigo para dropdownButton
        const SizedBox(
          height: 15,
        ),
        campoDescripcion(eg_desc_Ctrl),
        const SizedBox(
          height: 15,
        ),
        campoCantidad(eg_cant_Ctrl),
        const SizedBox(
          height: 15,
        ),
        campoPrecio(eg_prec_Ctrl),
        const SizedBox(
          height: 15,
        ),
        campoTotal(eg_total_Ctrl),
        const SizedBox(
          height: 15,
        ),
        botonAgregar(
            eg_desc_Ctrl, eg_cant_Ctrl, eg_prec_Ctrl, eg_total_Ctrl, usuario),
      ],
    )),
  );
}*/

Widget titulo() {
  return const Center(
    child: Text(
      "EGRESOS",
      style: TextStyle(
          color: Colors.blueGrey, fontSize: 35.0, fontWeight: FontWeight.bold),
    ),
  );
}

//DROPDOWNBUTTON ORIGINAL
/*Widget categoria() {
  String selectedValue = "Seleccione una categorĂ­a:";
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.black, width: 4),
    ),
    child: DropdownButton(
      items: [
        DropdownMenuItem<String>(
          child: Text("Alimentos"),
          value: "Alimentos",
        ),
        DropdownMenuItem<String>(
          child: Text("Gastos Escolares"),
          value: "Gastos Escolares",
        ),
        DropdownMenuItem<String>(
          child: Text("Transporte"),
          value: "Transporte",
        ),
        DropdownMenuItem<String>(
          child: Text("Servicios"),
          value: "Servicios",
        ),
        DropdownMenuItem<String>(
          child: Text("Gastos MĂ©dicos"),
          value: "Gastos MĂ©dicos",
        ),
        DropdownMenuItem<String>(
          child: Text("Entretenimientos"),
          value: "Entretenimiento",
        ),
        DropdownMenuItem<String>(
          child: Text("Otros"),
          value: "Otros",
        ),
      ],
      onChanged: (value) {
        selectedValue = value.toString();
      },
      isExpanded: true,
      dropdownColor: Colors.white,
      hint: Text(selectedValue),
      icon: const Icon(Icons.arrow_drop_down_circle_rounded),
      //value: selectedValue,
    ),
  );
}*/

Widget campoDescripcion(eg_desc_Ctrl) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: eg_desc_Ctrl,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.assignment),
          labelText: "DescripciĂ³n",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoCantidad(eg_cant_Ctrl) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextField(
        controller: eg_cant_Ctrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.add_shopping_cart),
          labelText: "Cantidad",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoPrecio(eg_prec_Ctrl) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextField(
        controller: eg_prec_Ctrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.monetization_on_outlined),
          labelText: "Precio",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoTotal(eg_total_Ctrl) {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: TextField(
        controller: eg_total_Ctrl,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.monetization_on_outlined),
          labelText: "Total",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget botonAgregar(dropDownCurrentValue, eg_desc_Ctrl, eg_cant_Ctrl,
    eg_prec_Ctrl, eg_total_Ctrl, usuario) {
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
          if (eg_desc_Ctrl.text == "" ||
              eg_cant_Ctrl.text == "" ||
              eg_prec_Ctrl.text == "" ||
              eg_total_Ctrl.text == "") {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("AtenciĂ³n"),
                content: Text(
                    "Por favor, ingrese la informaciĂ³n en todos los campos."),
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
            final egreso = <String, dynamic>{
              "usuario": usuario,
              "categorĂ­a": dropDownCurrentValue,
              "descripcion": eg_desc_Ctrl.text,
              "cantidad": eg_cant_Ctrl.text,
              "precio": eg_prec_Ctrl.text,
              "total": eg_total_Ctrl.text
            };
            db.collection("egresos").add(egreso).then((DocumentReference doc) =>
                print('EGRESO added with ID: ${doc.id}'));

            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("CORRECTO"),
                content: Text("Se ha registrado el egreso."),
                actions: [
                  FlatButton(
                      child: Text("Ok"),
                      onPressed: () {
                        eg_desc_Ctrl.clear();
                        eg_cant_Ctrl.clear();
                        eg_prec_Ctrl.clear();
                        eg_total_Ctrl.clear();
                        Navigator.of(context).pop();
                      })
                ],
              ),
            );
          }
        },
        child: const Text('Agregar Egreso'),
      ),
    );
  });
}
