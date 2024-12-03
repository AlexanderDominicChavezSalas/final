import 'package:flutter/material.dart';
import 'package:proyectofinal/src/view/common/GenericSensorPage.dart';

class SmokePage extends StatelessWidget {
  const SmokePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericSensorPage(
      title: "Medidor de Humo",
      description: "Monitoreo de niveles de humo en tiempo real",
      yAxisLabel: "Nivel de Humo",
      lineColor: Colors.purple,
      valueFormatter: (value) => "${value.toStringAsFixed(5)} ppm",
      getValue: (sensor) => sensor.smoke ?? 0.0,
    );
  }
}
