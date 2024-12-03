import 'package:flutter/material.dart';
import 'package:proyectofinal/src/view/common/GenericSensorPage.dart';
import 'package:proyectofinal/src/view/resources/app_colors.dart';

class HumidityPage extends StatelessWidget {
  const HumidityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericSensorPage(
      title: "Medidor de Humedad",
      description: "Monitoreo de humedad ambiental",
      yAxisLabel: "Humedad (%)",
      lineColor: AppColors.contentColorBlue,
      valueFormatter: (value) => "${value.toStringAsFixed(1)} %",
      getValue: (sensor) => sensor.humidity ?? 0.0,
    );
  }
}
