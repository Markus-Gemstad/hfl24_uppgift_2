import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'network_repository.dart';

class VehicleRepository extends NetworkRepository<Vehicle> {
  // Singleton
  static final VehicleRepository _instance = VehicleRepository._internal();
  static VehicleRepository get instance => _instance;
  VehicleRepository._internal()
      : super(serializer: VehicleSerializer(), resource: "vehicles");

  // @override
  // Future<Vehicle?> create(Vehicle item) async {
  //   Response response = await http.post(baseUri,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(item.toJson()));

  //   final json = jsonDecode(response.body);
  //   return Vehicle.fromJson(json);
  // }

  // @override
  // Future<Vehicle?> update(Vehicle item) async {
  //   Response response = await http.put(baseUri,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(item.toJson()));

  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body);
  //     return Vehicle.fromJson(json);
  //   } else if (response.statusCode == 400) {
  //     throw Exception('Kunde inte hitta fordon');
  //   } else {
  //     throw Exception('Gick inte att uppdatera fordon.');
  //   }
  // }

  // @override
  // Future<Vehicle?> getById(int id) async {
  //   Response response = await http.get(
  //     createUriWithId(id),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   final json = jsonDecode(response.body);
  //   return Vehicle.fromJson(json);
  // }

  // @override
  // Future<List<Vehicle>> getAll() async {
  //   final response = await http.get(
  //     baseUri,
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   final json = jsonDecode(response.body);
  //   return (json as List).map((item) => Vehicle.fromJson(item)).toList();
  // }

  // @override
  // Future<bool> delete(int id) async {
  //   final response = await http.delete(
  //     createUriWithId(id),
  //     headers: {'Content-Type': 'application/json'},
  //   );
  //   if (response.statusCode == 200) {
  //     return true;
  //   } else {
  //     throw Exception('Gick inte att ta bort person.');
  //   }
  // }
}
