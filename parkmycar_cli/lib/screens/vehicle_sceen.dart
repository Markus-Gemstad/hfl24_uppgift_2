import 'dart:io';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import '../repositories/person_repository.dart';
import '../repositories/vehicle_repository.dart';
import '../screens/screen_util.dart';

void screenAddVehicle() async {
  clearScreen();

  String regNr = readValidInputString(
      "Ange registreringsnummer (NNNXXX):", Validators.isValidRegNr);

  int typeIndex = readValidInputInt(
      "Ange type (1 = bil, 2 = motorcykel, 3 = lastbil):",
      Vehicle.isValidVehicleTypeValue);
  VehicleType type = VehicleType.values[typeIndex];

  String availablePersons = '';
  try {
    List<Person> allPersons = await PersonRepository.instance.getAll();
    if (allPersons.isNotEmpty) {
      Iterable<int> ids = allPersons.map((e) => e.id);
      availablePersons = ' (IDn: ${ids.join(',')})';
    }
  } catch (e) {
    stdout.writeln(
        "\nFEL! Det finns inga personer. Du måste först skapa en person.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int personId = readValidInputInt(
      "Ange ID på en person$availablePersons:", Validators.isValidId);

  try {
    await PersonRepository.instance.getById(personId);
  } catch (e) {
    stdout.writeln("\nFEL! Det finns ingen person med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  try {
    Vehicle? vehicle =
        await VehicleRepository.instance.create(Vehicle(regNr, personId, type));
    stdout.writeln("\nFordon skapat med följande uppgifter:\n");
    stdout.writeln(vehicle.toString());
  } catch (e) {
    stdout.writeln("\nGick inte att skapa nytt fordon. Felmeddelande: $e\n");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllVehicles() async {
  clearScreen();
  stdout.writeln("Följande fordon finns lagrade:\n");

  List<Vehicle> vehicles = await VehicleRepository.instance.getAll();
  vehicles.forEach(print);

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdateVehicle() async {
  clearScreen();

  String availableVehicles = '';
  try {
    List<Vehicle> allVehicles = await VehicleRepository.instance.getAll();
    if (allVehicles.isNotEmpty) {
      Iterable<int> ids = allVehicles.map((e) => e.id);
      availableVehicles = ' (IDn: ${ids.join(',')})';
    }
  } finally {
    // Do nothing, maybe adding will work anyway
  }

  int id = readValidInputInt(
      "Ange ID på fordon som ska ändras$availableVehicles:",
      Validators.isValidId);

  try {
    await VehicleRepository.instance.getById(id);
  } catch (e) {
    stdout.write("\nFEL! Det finns inget fordon med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String regNr = readValidInputString(
      "Ange registreringsnummer (NNNXXX):", Validators.isValidRegNr);

  int typeIndex = readValidInputInt(
      "Ange type (1 = bil, 2 = motorcykel, 3 = lastbil):",
      Vehicle.isValidVehicleTypeValue);
  VehicleType type = VehicleType.values[typeIndex];

  String availablePersons = '';
  try {
    List<Person> allPersons = await PersonRepository.instance.getAll();
    if (allPersons.isNotEmpty) {
      Iterable<int> ids = allPersons.map((e) => e.id);
      availablePersons = ' (IDn: ${ids.join(',')})';
    }
  } catch (e) {
    stdout.writeln(
        "\nFEL! Det finns inga personer. Du måste först skapa en person.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int personId = readValidInputInt(
      "Ange ID på en person$availablePersons:", Validators.isValidId);

  try {
    await PersonRepository.instance.getById(personId);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen person med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  try {
    Vehicle? vehicle = await VehicleRepository.instance
        .update(Vehicle(regNr, personId, type, id));
    stdout.writeln("Fordonet updaterat med följande uppgifter:\n");
    stdout.writeln(vehicle.toString());
  } catch (e) {
    stdout.writeln("\nGick inte att uppdatera fordon. Felmeddelande: $e\n");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeleteVehicle() async {
  clearScreen();

  String availableVehicles = '';
  try {
    List<Vehicle> allVehicles = await VehicleRepository.instance.getAll();
    if (allVehicles.isNotEmpty) {
      Iterable<int> ids = allVehicles.map((e) => e.id);
      availableVehicles = ' (IDn: ${ids.join(',')})';
    }
  } finally {
    // Do nothing, maybe adding will work anyway
  }

  int id = readValidInputInt(
      "Ange ID på fordon som ska tas bort$availableVehicles:",
      Validators.isValidId);

  try {
    await VehicleRepository.instance.delete(id);
    stdout.writeln("\nFordon med ID $id har tagits bort!");
  } catch (e) {
    stdout.writeln("\nFEL! Fordon med ID $id kunde inte tas bort! $e");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
