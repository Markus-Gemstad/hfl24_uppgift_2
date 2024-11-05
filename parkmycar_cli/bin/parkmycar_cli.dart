import 'dart:io';
import 'package:parkmycar_cli/models/menu.dart';
import 'package:parkmycar_cli/repositories/parking_repository.dart';
import 'package:parkmycar_cli/repositories/parking_space_repository.dart';
import 'package:parkmycar_cli/repositories/person_repository.dart';
import 'package:parkmycar_cli/repositories/vehicle_repository.dart';
import 'package:parkmycar_cli/screens/screen_util.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';

void main() async {
  // await prePopulateRepositories();

  bool exit = false;
  while (!exit) {
    MenuItem? selectedMenu = displayMenu(
        "Välkommen till ParkMyCar!\n\nVad vill du hantera?\n", menu);
    if (selectedMenu != null) {
      exit = selectedMenu.doExit;
      bool back = false;
      while (!exit && !back) {
        MenuItem? selectedSubMenu = displayMenu(
            "Du har valt att hantera ${selectedMenu.name}. Vad vill du göra?\n",
            selectedMenu.subMenu!);
        if (selectedSubMenu != null) {
          back = selectedSubMenu.doBack;
          exit = selectedSubMenu.doExit;
          if (selectedSubMenu.screenFunction != null) {
            await selectedSubMenu.screenFunction!();
          }
        }
      }
    }
  }
  print("Programmet avslutas...");
}

prePopulateRepositories() async {
  await PersonRepository.instance
      .create(Person("Markus Gemstad", "1122334455"));
  await VehicleRepository.instance
      .create(Vehicle("ABC123", 1, VehicleType.car));
  await VehicleRepository.instance
      .create(Vehicle("BCD234", 1, VehicleType.motorcycle));
  await ParkingSpaceRepository.instance
      .create(ParkingSpace("Bergtallsvägen 10, 134 54 Älvsjö", 100));

  DateTime endTime = DateTime.now().add(const Duration(hours: 1));
  await ParkingRepository.instance
      .create(Parking(1, 1, DateTime.now(), endTime));
}

MenuItem? displayMenu(String intro, List<MenuItem> menu) {
  String choices = "";

  for (var i = 0; i < menu.length; i++) {
    choices += '${i + 1}. ${menu[i].name}\n';
  }

  clearScreen();
  stdout.write("$intro\n$choices\nVälj ett alternativ (1-${menu.length}): ");

  int? nr = int.tryParse(stdin.readLineSync()!);
  if (nr != null && nr > 0 && nr <= menu.length) {
    return menu[nr - 1];
  } else {
    return null;
  }
}
