// ignore_for_file: file_names, avoid_unnecessary_containers, sort_child_properties_last, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';

class Cuentas extends StatefulWidget {
  const Cuentas({Key? key}) : super(key: key);

  @override
  State<Cuentas> createState() => _CuentasState();
}

class _CuentasState extends State<Cuentas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(),
    );
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
        categoria(),
        const SizedBox(
          height: 15,
        ),
        campoDescripcion(),
        const SizedBox(
          height: 15,
        ),
        campoCantidad(),
        const SizedBox(
          height: 15,
        ),
        campoPrecio(),
        const SizedBox(
          height: 15,
        ),
        campoTotal(),
        const SizedBox(
          height: 15,
        ),
        botonAgregar(),
      ],
    )),
  );
}

Widget menu() {
  //aun falta
  return Container(
    child: Column(),
  );
}

Widget categoria() {
  String selectedValue = "Seleccione una categoría:";
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.black, width: 4),
    ),
    child: DropdownButton(
      items: const [
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
          child: Text("Gastos Médicos"),
          value: "Gastos Médicos",
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
      onChanged: (value) {},
      isExpanded: true,
      dropdownColor: Colors.white,
      hint: Text(selectedValue),
      icon: const Icon(Icons.arrow_drop_down_circle_rounded),
      //value: selectedValue,
    ),
  );
}

Widget campoDescripcion() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: const TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          icon: Icon(Icons.assignment),
          labelText: "Descripción",
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  });
}

Widget campoCantidad() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: const TextField(
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

Widget campoPrecio() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: const TextField(
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

Widget campoTotal() {
  return StreamBuilder(builder: (BuildContext context, AsyncSnapshot snapshot) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 120),
      child: const TextField(
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

Widget botonAgregar() {
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
        child: const Text('Agregar'),
      ),
    );
  });
}
