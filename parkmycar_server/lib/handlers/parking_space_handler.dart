import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import '../repositories/parking_space_repository.dart';

Future<Response> postParkingSpaceHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    ParkingSpace parsedParkingSpace = ParkingSpaceSerializer().fromJson(json);
    ParkingSpace? newParkingSpace =
        await ParkingSpaceRepository.instance.create(parsedParkingSpace);

    if (newParkingSpace != null) {
      return Response.ok(
        jsonEncode(ParkingSpaceSerializer().toJson(newParkingSpace)),
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
Future<Response> getParkingSpacesHandler(Request request) async {
  try {
    final persons = await ParkingSpaceRepository.instance.getAll();
    final body =
        persons.map((e) => ParkingSpaceSerializer().toJson(e)).toList();
    return Response.ok(
      jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e) {
    return Response.badRequest();
  }
}

/// Get by id
Future<Response> getParkingSpaceHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    final person = await ParkingSpaceRepository.instance.getById(parsedId!);

    if (person != null) {
      return Response.ok(
        jsonEncode(ParkingSpaceSerializer().toJson(person)),
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
Future<Response> updateParkingSpaceHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    ParkingSpace parsedParkingSpace = ParkingSpaceSerializer().fromJson(json);
    ParkingSpace? updatedParkingSpace =
        await ParkingSpaceRepository.instance.update(parsedParkingSpace);

    if (updatedParkingSpace != null) {
      return Response.ok(
        jsonEncode(ParkingSpaceSerializer().toJson(updatedParkingSpace)),
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
Future<Response> deleteParkingSpaceHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    bool deleted = await ParkingSpaceRepository.instance.delete(parsedId!);
    return (deleted)
        ? Response.ok('ParkingSpace deleted.')
        : Response.badRequest(body: objectNotFound);
  } catch (e) {
    return Response.badRequest();
  }
}
