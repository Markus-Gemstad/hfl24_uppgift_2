import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import '../repositories/vehicle_repository.dart';

Future<Response> postVehicleHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    Vehicle parsedVehicle = VehicleSerializer().fromJson(json);
    Vehicle? newVehicle =
        await VehicleRepository.instance.create(parsedVehicle);

    if (newVehicle != null) {
      return Response.ok(
        jsonEncode(VehicleSerializer().toJson(newVehicle)),
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
Future<Response> getVehiclesHandler(Request request) async {
  try {
    final vehicles = await VehicleRepository.instance.getAll();
    final body = vehicles.map((e) => VehicleSerializer().toJson(e)).toList();
    return Response.ok(
      jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e) {
    return Response.badRequest();
  }
}

/// Get by id
Future<Response> getVehicleHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    final vehicle = await VehicleRepository.instance.getById(parsedId!);

    if (vehicle != null) {
      return Response.ok(
        jsonEncode(VehicleSerializer().toJson(vehicle)),
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
Future<Response> updateVehicleHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    Vehicle parsedVehicle = VehicleSerializer().fromJson(json);
    Vehicle? updatedVehicle =
        await VehicleRepository.instance.update(parsedVehicle);

    if (updatedVehicle != null) {
      return Response.ok(
        jsonEncode(VehicleSerializer().toJson(updatedVehicle)),
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
Future<Response> deleteVehicleHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    bool deleted = await VehicleRepository.instance.delete(parsedId!);
    return (deleted)
        ? Response.ok('Vehicle deleted.')
        : Response.badRequest(body: objectNotFound);
  } catch (e) {
    return Response.badRequest();
  }
}
