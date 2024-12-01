import 'package:flutter/material.dart';
import 'package:proyectofinal/src/viewmodel/viewmodel.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Sensores'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Perfil",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Registro de sensores",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: pageController.SensorData.length,
              itemBuilder: (context, index) {
                final sensor = pageController.SensorData[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text(
                      sensor.id.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      "Marca de tiempo: ${sensor.ts}",
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        _showUnenrollConfirmation(
                            context, pageController, index);
                      },
                    ),
                    tileColor: const Color.fromARGB(255, 97, 3, 3),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showUnenrollConfirmation(
      BuildContext context, ViewModel pageController, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Eliminar Marca'),
          content:
              const Text('¿Estás seguro de que deseas eliminar este dato?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                pageController.deleteSensor(
                    pageController.SensorData[index].id.toString(), index);
                Navigator.of(context).pop(); // Cerrar el modal
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
