import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import '../repositories/person_repository.dart';

Future<Response> postPersonHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    Person parsedPerson = PersonSerializer().fromJson(json);
    if (parsedPerson.isValid()) {
      Person? newPerson = await PersonRepository.instance.create(parsedPerson);

      if (newPerson != null) {
        return Response.ok(
          jsonEncode(PersonSerializer().toJson(newPerson)),
          headers: {'Content-Type': 'application/json'},
        );
      } else {
        return Response.badRequest(body: objectNotCreated);
      }
    } else {
      return Response.badRequest(body: invalidInputData);
    }
  } catch (e) {
    return Response.badRequest();
  }
}

/// Get all
Future<Response> getPersonsHandler(Request request) async {
  try {
    final persons = await PersonRepository.instance.getAll();
    final body = persons.map((e) => PersonSerializer().toJson(e)).toList();
    return Response.ok(
      jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
  } catch (e) {
    return Response.badRequest();
  }
}

/// Get by id
Future<Response> getPersonHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    final person = await PersonRepository.instance.getById(parsedId!);

    if (person != null) {
      return Response.ok(
        jsonEncode(PersonSerializer().toJson(person)),
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
Future<Response> updatePersonHandler(Request request) async {
  try {
    final data = await request.readAsString();
    final json = jsonDecode(data);
    Person parsedPerson = PersonSerializer().fromJson(json);
    if (parsedPerson.isValid()) {
      Person? updatedPerson =
          await PersonRepository.instance.update(parsedPerson);

      if (updatedPerson != null) {
        return Response.ok(
          jsonEncode(PersonSerializer().toJson(updatedPerson)),
          headers: {'Content-Type': 'application/json'},
        );
      } else {
        return Response.badRequest(body: objectNotFound);
      }
    } else {
      return Response.badRequest(body: invalidInputData);
    }
  } catch (e) {
    return Response.badRequest();
  }
}

/// Delete by id
Future<Response> deletePersonHandler(Request request, String id) async {
  try {
    final parsedId = int.tryParse(id);
    bool deleted = await PersonRepository.instance.delete(parsedId!);
    return (deleted)
        ? Response.ok('Person deleted.')
        : Response.badRequest(body: objectNotFound);
  } catch (e) {
    return Response.badRequest();
  }
}
