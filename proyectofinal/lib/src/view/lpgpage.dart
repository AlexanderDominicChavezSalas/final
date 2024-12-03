import 'package:flutter/material.dart';
import 'package:proyectofinal/src/view/common/GenericSensorPage.dart';

class LpgPage extends StatelessWidget {
  const LpgPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericSensorPage(
      title: "Medidor de GPL",
      description:
          "Monitoreo de niveles de gas licuado de petróleo (GPL) en tiempo real",
      yAxisLabel: "Nivel de GPL",
      lineColor: Colors.orange,
      valueFormatter: (value) => "${value.toStringAsFixed(5)} ppm",
      getValue: (sensor) => sensor.lpg ?? 0.0,
    );
  }
}
