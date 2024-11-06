import 'dart:io';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import '../repositories/parking_space_repository.dart';
import '../screens/screen_util.dart';

void screenAddParkingSpace() async {
  clearScreen();

  String address = readValidInputString(
      "Ange adress (1-1000 tecken):", Validators.isValidAddress);

  int pricePerHour =
      readValidInputInt("Ange pris per timme:", Validators.isValidPricePerHour);

  try {
    ParkingSpace? parkingSpace = await ParkingSpaceRepository.instance
        .create(ParkingSpace(address, pricePerHour));
    stdout.writeln("Parkeringsplats skapad med följande uppgifter:\n");
    stdout.writeln(parkingSpace.toString());
  } catch (e) {
    stdout.writeln(
        "\nGick inte att skapa ny parkeringsplats. Felmeddelande: $e\n");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenShowAllParkingSpaces() async {
  clearScreen();
  stdout.writeln("Följande parkringsplatser finns lagrade:\n");

  try {
    List<ParkingSpace> parkingSpaces =
        await ParkingSpaceRepository.instance.getAll();
    parkingSpaces.forEach(print);
  } catch (e) {
    stdout.writeln(
        "\nGick inte att hämta parkeringsplatser. Felmeddelande: $e\n");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenUpdateParkingSpace() async {
  clearScreen();

  String availableParkingSpaces = '';
  try {
    List<ParkingSpace> allParkingSpaces =
        await ParkingSpaceRepository.instance.getAll();
    if (allParkingSpaces.isNotEmpty) {
      Iterable<int> ids = allParkingSpaces.map((e) => e.id);
      availableParkingSpaces = ' (IDn: ${ids.join(',')})';
    }
  } finally {
    // Do nothing, maybe adding will work anyway
  }

  int id = readValidInputInt(
      "Ange ID på parkeringsplats som ska ändras$availableParkingSpaces:",
      Validators.isValidId);

  try {
    await ParkingSpaceRepository.instance.getById(id);
  } catch (e) {
    stdout.write("\nFEL! Det finns ingen parkeringsplats med angivet ID.");
    stdout.write("\nTryck ENTER för att gå tillbaka");
    stdin.readLineSync();
    return;
  }

  String address = readValidInputString(
      "Ange ny adress (1-1000 tecken):", Validators.isValidAddress);

  int pricePerHour = readValidInputInt(
      "Ange nytt pris per timme:", Validators.isValidPricePerHour);

  try {
    ParkingSpace? parkingSpace = await ParkingSpaceRepository.instance
        .update(ParkingSpace(address, pricePerHour, id));
    stdout.writeln("Parkeringsplats updaterad med följande uppgifter:\n");
    stdout.writeln(parkingSpace.toString());
  } catch (e) {
    stdout.writeln(
        "\nGick inte att uppdatera parkeringsplats. Felmeddelande: $e\n");
  }
  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}

void screenDeleteParkingSpace() async {
  clearScreen();

  String availableParkingSpaces = '';
  try {
    List<ParkingSpace> allParkingSpaces =
        await ParkingSpaceRepository.instance.getAll();
    if (allParkingSpaces.isNotEmpty) {
      Iterable<int> ids = allParkingSpaces.map((e) => e.id);
      availableParkingSpaces = ' (IDn: ${ids.join(',')})';
    }
  } finally {
    // Do nothing, maybe adding will work anyway
  }

  int id = readValidInputInt(
      "Ange ID på parkeringsplats som ska tas bort$availableParkingSpaces:",
      Validators.isValidId);

  try {
    await ParkingSpaceRepository.instance.delete(id);
    stdout.writeln("\nParkeringsplats med ID $id har tagits bort!");
  } catch (e) {
    stdout.writeln("\nFEL! Parkeringsplats med ID $id kunde inte tas bort! $e");
  }

  stdout.write("\nTryck ENTER för att gå tillbaka");
  stdin.readLineSync();
}
