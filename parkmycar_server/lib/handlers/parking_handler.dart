import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import '../repositories/parking_repository.dart';

Future<Response> postParkingHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    Parking parsedParking = ParkingSerializer().fromJson(json);
    Parking? newParking =
        await ParkingRepository.instance.create(parsedParking);

    if (newParking != null) {
      return Response.ok(
        jsonEncode(ParkingSerializer().toJson(newParking)),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      return Response.badRequest(body: objectNotCreated);
    }
  } catch (e) {
    return Response.badRequest();
  }
}

/// Get all
Future<Response> getParkingsHandler(Request request) async {
  try {
    final persons = await ParkingRepository.instance.getAll();
    final body = persons.map((e) => ParkingSerializer().toJson(e)).toList();
    return Response.ok(
      jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e) {
    return Response.badRequest();
  }
}

/// Get by id
Future<Response> getParkingHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    final person = await ParkingRepository.instance.getById(parsedId!);

    if (person != null) {
      return Response.ok(
        jsonEncode(ParkingSerializer().toJson(person)),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      return Response.badRequest(body: objectNotFound);
    }
  } catch (e) {
    return Response.badRequest();
  }
}

/// Update
Future<Response> updateParkingHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    Parking parsedParking = ParkingSerializer().fromJson(json);
    Parking? updatedParking =
        await ParkingRepository.instance.update(parsedParking);

    if (updatedParking != null) {
      return Response.ok(
        jsonEncode(ParkingSerializer().toJson(updatedParking)),
        headers: {'Content-Type': 'application/json'},
      );
    } else {
      return Response.badRequest(body: objectNotFound);
    }
  } catch (e) {
    return Response.badRequest();
  }
}

/// Delete by id
Future<Response> deleteParkingHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    bool deleted = await ParkingRepository.instance.delete(parsedId!);
    return (deleted)
        ? Response.ok('Parking deleted.')
        : Response.badRequest(body: objectNotFound);
  } catch (e) {
    return Response.badRequest();
  }
}
