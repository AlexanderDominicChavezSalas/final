import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal/src/viewmodel/viewmodel.dart';

class Mynavbar extends StatelessWidget {
  const Mynavbar({super.key});
  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ViewModel>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed, // Permite más de 3 ítems.
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.cloud_outlined),
          label: "CO",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.water_drop_outlined),
          label: "Humedad",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_gas_station),
          label: "GPL",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.smoking_rooms),
          label: "Humo",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.thermostat_outlined),
          label: "Temp",
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            pageController.navigateToCoPage();
            break;
          case 1:
            pageController.navigateToHumidityPage();
            break;
          case 2:
            pageController.navigateToLPGPage();
            break;
          case 3:
            pageController.navigateToSmokePage();
            break;
          case 4:
            pageController.navigateToTempPage();
            break;
        }
      },
    );
  }
}
