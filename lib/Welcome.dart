// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, depend_on_referenced_packages, unused_local_variable, unused_field

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'Cuentas.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int _paginaActual = 0;
  final List<Widget> _paginas = [
    //Páginas del Navigation Bar
    cuerpo(),
    const Cuentas(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: cuerpo(),*/ body: _paginas[_paginaActual],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _paginaActual = index;
          });
        },
        currentIndex: _paginaActual,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.attach_money_outlined), label: "Cuentas"),
          const BottomNavigationBarItem(
              icon: Icon(Icons.close_outlined), label: "Logout"),
        ],
      ),
    );
  }
}

Widget cuerpo() {
  // ignore: avoid_unnecessary_containers
  return Container(
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        bienvenida(),
        grafica(),
      ],
    )),
  );
}

Widget bienvenida() {
  return const Text(
    "BIENVENIDO",
    style: TextStyle(
        color: Colors.blueGrey, fontSize: 35.0, fontWeight: FontWeight.bold),
  );
}

Widget grafica() {
  late List<Datos> _chartData;
  late TooltipBehavior _tooltipBehavior;
  _chartData = getChartData();
  _tooltipBehavior = TooltipBehavior(enable: true);
  return SfCircularChart(
    title: ChartTitle(text: 'Egresos Mensuales'),
    legend: Legend(isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
    tooltipBehavior: _tooltipBehavior,
    series: <CircularSeries>[
      //PieSeries<Datos, String>( //Gráfica de Pastel
      //DoughnutSeries<Datos, String>( //Grafica de Dona
      RadialBarSeries<Datos, String>(
          dataSource: _chartData,
          xValueMapper: (Datos data, _) => data.categoria,
          yValueMapper: (Datos data, _) => data.cantidad,
          enableTooltip: true,
          maximumValue: 10000, //Solo para la RadialBarSeries
          // ignore: prefer_const_constructors
          dataLabelSettings: DataLabelSettings(
            isVisible: true,
          ))
    ],
  );
}

class Datos {
  //Contenedor de datos.
  Datos(this.categoria, this.cantidad);
  final String categoria;
  final double cantidad;
}

List<Datos> getChartData() {
  //Datos que entran a la gráfica
  final List<Datos> chartData = [
    Datos('Alimentos', 500.74),
    Datos('Gastos Escolares', 100.6),
    Datos('Transporte', 90.56),
    Datos('Servicios', 8000.14),
    Datos('Gastos Médicos', 7000.85),
    Datos('Entretenimiento', 1200.4),
    Datos('Otros', 750.9),
  ];
  return chartData;
}
