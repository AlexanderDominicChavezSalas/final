import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyectofinal/src/viewmodel/viewmodel.dart';

class Mynavbar extends StatelessWidget {
  const Mynavbar({super.key});
  @override
  Widget build(BuildContext context) {
    final pageController = Provider.of<ViewModel>(context);
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              pageController.navigateToCoPage();
            },
            child: Text("Co")),
        ElevatedButton(
            onPressed: () {
              pageController.navigateToHumidityPage();
            },
            child: Text("Hum")),
        ElevatedButton(
            onPressed: () {
              pageController.navigateToLPGPage();
            },
            child: Text("LPG")),
        ElevatedButton(
            onPressed: () {
              pageController.navigateToSmokePage();
            },
            child: Text("Smoke")),
        ElevatedButton(
            onPressed: () {
              pageController.navigateToTempPage();
            },
            child: Text("Te")),
      ],
    );
  }
}
