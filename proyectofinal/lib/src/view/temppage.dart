import 'package:flutter/material.dart';
import 'package:proyectofinal/src/view/common/GenericSensorPage.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericSensorPage(
      title: "Medidor de Temperatura",
      description: "Monitoreo de temperatura ambiental en tiempo real",
      yAxisLabel: "Temperatura (°C)",
      lineColor: Colors.red,
      valueFormatter: (value) => "${value.toStringAsFixed(1)} °C",
      getValue: (sensor) => sensor.temp ?? 0.0,
    );
  }
}
