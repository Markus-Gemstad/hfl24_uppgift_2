import 'dart:io';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import '../repositories/parking_repository.dart';
import '../repositories/parking_space_repository.dart';
import '../repositories/vehicle_repository.dart';
import '../screens/screen_util.dart';

void screenAddParking() async {
  clearScreen();

  String availableVehicles = '';
  try {
    List<Vehicle> allVehicles = await VehicleRepository.instance.getAll();
    if (allVehicles.isNotEmpty) {
      Iterable<int> ids = allVehicles.map((e) => e.id);
      availableVehicles = ' (IDn: ${ids.join(',')})';
    }
  } catch (e) {
    stdout.writeln(
        "\nFEL! Det finns inga fordon. Du måste först skapa ett fordon.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int vehicleId = readValidInputInt(
      "Ange ID på ett fordon$availableVehicles:", Validators.isValidId);

  try {
    await VehicleRepository.instance.getById(vehicleId);
  } catch (e) {
    stdout.write("\nFEL! Det finns inget fordon med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String availableParkingSpaces = '';
  try {
    List<ParkingSpace> allParkingSpaces =
        await ParkingSpaceRepository.instance.getAll();
    if (allParkingSpaces.isNotEmpty) {
      Iterable<int> ids = allParkingSpaces.map((e) => e.id);
      availableParkingSpaces = ' (IDn: ${ids.join(',')})';
    }
  } catch (e) {
    stdout.writeln(
        "\nFEL! Det finns inga parkeringsplatser. Du måste först skapa en parkeringsplats.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int parkingSpaceId = readValidInputInt(
      "Ange ID på en parkeringsplats$availableParkingSpaces:",
      Validators.isValidId);

  try {
    await ParkingSpaceRepository.instance.getById(parkingSpaceId);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkeringsplats med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String startTimeString = readValidInputString(
      "Ange starttid (YYYY-MM-DD HH:MM):", Validators.isValidDateTime);
  DateTime startTime = DateTime.parse(startTimeString);

  String endTimeString = readValidInputString(
      "Ange sluttid (YYYY-MM-DD HH:MM):", Validators.isValidDateTime);
  DateTime endTime = DateTime.parse(endTimeString);

  try {
    Parking? parking = await ParkingRepository.instance
        .create(Parking(vehicleId, parkingSpaceId, startTime, endTime));
    stdout.writeln("Parkering skapat med följande uppgifter:\n");
    stdout.writeln(parking.toString());
  } catch (e) {
    stdout.writeln("\nGick inte att skapa ny parkering. Felmeddelande: $e\n");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllParkings() async {
  clearScreen();
  stdout.writeln("Följande parkeringar finns lagrade:\n");

  try {
    List<Parking> parkings = await ParkingRepository.instance.getAll();
    parkings.forEach(print);
  } catch (e) {
    stdout.writeln("\nGick inte att hämta parkeringar. Felmeddelande: $e\n");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdateParking() async {
  clearScreen();

  String availableParkings = '';
  try {
    List<Parking> allParkings = await ParkingRepository.instance.getAll();
    if (allParkings.isNotEmpty) {
      Iterable<int> ids = allParkings.map((e) => e.id);
      availableParkings = ' (IDn: ${ids.join(',')})';
    }
  } finally {
    // Do nothing, maybe adding will work anyway
  }

  int id = readValidInputInt(
      "Ange ID på parkeringen som ska ändras$availableParkings:",
      Validators.isValidId);

  try {
    await ParkingRepository.instance.getById(id);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkering med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String availableVehicles = '';
  try {
    List<Vehicle> allVehicles = await VehicleRepository.instance.getAll();
    if (allVehicles.isNotEmpty) {
      Iterable<int> ids = allVehicles.map((e) => e.id);
      availableVehicles = ' (IDn: ${ids.join(',')})';
    }
  } catch (e) {
    stdout.writeln(
        "\nFEL! Det finns inga fordon. Du måste först skapa ett fordon.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int vehicleId = readValidInputInt(
      "Ange ID på ett fordon$availableVehicles:", Validators.isValidId);

  try {
    await VehicleRepository.instance.getById(vehicleId);
  } catch (e) {
    stdout.write("\nFEL! Det finns inget fordon med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String availableParkingSpaces = '';
  try {
    List<ParkingSpace> allParkingSpaces =
        await ParkingSpaceRepository.instance.getAll();
    if (allParkingSpaces.isNotEmpty) {
      Iterable<int> ids = allParkingSpaces.map((e) => e.id);
      availableParkingSpaces = ' (IDn: ${ids.join(',')})';
    }
  } catch (e) {
    stdout.writeln(
        "\nFEL! Det finns inga parkeringsplatser. Du måste först skapa en parkeringsplats.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  int parkingSpaceId = readValidInputInt(
      "Ange ID på en parkeringsplats$availableParkingSpaces:",
      Validators.isValidId);

  try {
    await ParkingSpaceRepository.instance.getById(parkingSpaceId);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkeringsplats med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String startTimeString = readValidInputString(
      "Ange starttid (YYYY-MM-DD HH:MM):", Validators.isValidDateTime);
  DateTime startTime = DateTime.parse(startTimeString);

  String endTimeString = readValidInputString(
      "Ange sluttid (YYYY-MM-DD HH:MM):", Validators.isValidDateTime);
  DateTime endTime = DateTime.parse(endTimeString);

  try {
    Parking? parking = await ParkingRepository.instance
        .update(Parking(vehicleId, parkingSpaceId, startTime, endTime, id));
    stdout.writeln("Parkeringen updaterad med följande uppgifter:\n");
    stdout.writeln(parking.toString());
  } catch (e) {
    stdout.writeln("\nGick inte att uppdatera parkering. Felmeddelande: $e\n");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeleteParking() async {
  clearScreen();

  String availableParkings = '';
  try {
    List<Parking> allParkings = await ParkingRepository.instance.getAll();
    if (allParkings.isNotEmpty) {
      Iterable<int> ids = allParkings.map((e) => e.id);
      availableParkings = ' (IDn: ${ids.join(',')})';
    }
  } finally {
    // Do nothing, maybe adding will work anyway
  }

  int id = readValidInputInt(
      "Ange ID på parkeringen som ska tas bort$availableParkings:",
      Validators.isValidId);

  try {
    await ParkingRepository.instance.delete(id);
    stdout.writeln("\nParkering med ID $id har tagits bort!");
  } catch (e) {
    stdout.writeln("\nFEL! Parkering med ID $id kunde inte tas bort! $e");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
