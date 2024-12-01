import 'package:flutter/material.dart';
import 'package:proyectofinal/src/view/common/MyNavBar.dart';
import 'package:proyectofinal/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class Lpgpage extends StatelessWidget {
  const Lpgpage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Medidor de LPG"),
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: pageController.SensorData.length,
          itemBuilder: (context, index) {
            final sensor = pageController.SensorData[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                title: Text(
                  "Marca de tiempo: ${sensor.ts}",
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "Registro de LPG: ${sensor.lpg}",
                  style: const TextStyle(color: Colors.white),
                ),
                tileColor: const Color.fromARGB(255, 97, 3, 3),
              ),
            );
          },
        ),
        bottomNavigationBar: Mynavbar());
  }
}
