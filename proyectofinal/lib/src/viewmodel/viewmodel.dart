import 'package:flutter/material.dart';
import 'package:proyectofinal/helper/navigator.dart';
import 'package:proyectofinal/helper/network.dart';
import 'package:proyectofinal/src/model/models.dart';
import 'package:proyectofinal/src/view/copage.dart';
import 'package:proyectofinal/src/view/humiditypage.dart';
import 'package:proyectofinal/src/view/lpgpage.dart';
import 'package:proyectofinal/src/view/profilepage.dart';
import 'package:proyectofinal/src/view/smokepage.dart';
import 'package:proyectofinal/src/view/temppage.dart';

class ViewModel extends ChangeNotifier {
  final NavigationService _navigationService;

  List<Sensor> SensorData = [];

  ViewModel(this._navigationService) {
    getSensors();
  }

  navigateToCoPage() {
    _navigationService.navigate(const CoPage());
  }

  navigateToHumidityPage() {
    _navigationService.navigate(const Humiditypage());
  }

  navigateToLPGPage() {
    _navigationService.navigate(const Lpgpage());
  }

  navigateToSmokePage() {
    _navigationService.navigate(const Smokepage());
  }

  navigateToTempPage() {
    _navigationService.navigate(const Temppage());
  }

  navigateToProfilePage() {
    _navigationService.navigate(const ProfilePage());
  }

  getSensors() async {
    //_navigationService.showLoader();
    //var resData = await ApiProvider().get('/sensors/all');
    var resData = [
      {
        "id": 1,
        "ts": 1594512099.589146,
        "co": 0.004403026829699689,
        "humidity": 76.80000305175781,
        "lpg": 0.007023337145877314,
        "smoke": 0.018628225377018803,
        "temp": 27.9
      },
      {
        "id": 3,
        "ts": 1594512104.4684107,
        "co": 0.004391003954583357,
        "humidity": 77.9000015258789,
        "lpg": 0.007009458543138704,
        "smoke": 0.01858890754005078,
        "temp": 27.1
      }
    ];
    SensorData = resData.map<Sensor>((item) => Sensor.fromJson(item)).toList();
    //_navigationService.goBack(); //sirve para q no se quede cargando
    notifyListeners();
  }

  deleteSensor(id, index) async {
    _navigationService.showLoader();
    var resData = await ApiProvider().delete('/sensors/' + id);
    _navigationService.goBack();
    if (resData != null) {
      SensorData.removeAt(index);
      notifyListeners();
    } else {
      print("Algo salió mal y no se elimino");
    }
  }
}
