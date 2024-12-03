import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal/src/model/models.dart';
import 'package:proyectofinal/src/view/common/MyNavBar.dart';
import 'package:proyectofinal/src/viewmodel/viewmodel.dart';

class GenericSensorPage extends StatelessWidget {
  final String title; // Título de la página
  final String description; // Descripción opcional
  final String yAxisLabel; // Etiqueta del eje Y
  final Color lineColor; // Color de la línea
  final String Function(double) valueFormatter; // Formateador de valores
  final double Function(Sensor)
      getValue; // Función para obtener el valor específico

  const GenericSensorPage({
    super.key,
    required this.title,
    required this.description,
    required this.yAxisLabel,
    required this.lineColor,
    required this.valueFormatter,
    required this.getValue,
  });

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("PROYECTO FINAL"),
      ),
      body: Column(
        children: [
          // Título y descripción opcional
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          // Gráfico Lineal
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: pageController.SensorData.asMap()
                          .entries
                          .map((entry) => FlSpot(
                                entry.key.toDouble(),
                                getValue(entry.value),
                              ))
                          .toList(),
                      isCurved: true,
                      gradient: LinearGradient(
                        colors: [
                          lineColor,
                          lineColor.withOpacity(0.5),
                        ],
                      ),
                      barWidth: 6,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          colors: [
                            lineColor.withOpacity(0.2),
                            Colors.transparent,
                          ],
                          stops: const [0.1, 1],
                        ),
                      ),
                    ),
                  ],
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 80,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            valueFormatter(value),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.right,
                          );
                        },
                      ),
                    ),
                    bottomTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: const Border(
                      bottom: BorderSide(color: Colors.black, width: 1),
                      left: BorderSide(color: Colors.black, width: 1),
                      right: BorderSide(color: Colors.transparent),
                      top: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: true,
                    horizontalInterval: 5,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                    getDrawingVerticalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.5),
                        strokeWidth: 1,
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          // Leyenda
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                  height: 3,
                  color: lineColor,
                  margin: const EdgeInsets.only(right: 8),
                ),
                Text(
                  yAxisLabel,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Mynavbar(),
    );
  }
}
