import 'package:flutter/material.dart';
import 'package:proyectofinal/src/view/common/GenericSensorPage.dart';
import 'package:proyectofinal/src/view/resources/app_colors.dart';

class CoPage extends StatelessWidget {
  const CoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericSensorPage(
      title: "Medidor de CO",
      description: "Monitoreo de niveles de CO en tiempo real",
      yAxisLabel: "Nivel de Monóxido de Carbono (CO)",
      lineColor: AppColors.contentColorGreen,
      valueFormatter: (value) => "${value.toDouble().toStringAsFixed(4)} ppm",
      getValue: (sensor) => sensor.co ?? 0.0,
    );
  }
}
