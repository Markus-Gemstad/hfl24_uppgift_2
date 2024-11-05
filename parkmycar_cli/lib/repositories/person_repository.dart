import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'network_repository.dart';

class PersonRepository extends NetworkRepository<Person> {
  // Singleton
  static final PersonRepository _instance = PersonRepository._internal();
  static PersonRepository get instance => _instance;
  PersonRepository._internal()
      : super(serializer: PersonSerializer(), resource: "persons");

  /// Send item serialized as json over http to server
  // @override
  // Future<Person?> create(Person item) async {
  //   Response response = await http.post(baseUri,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(item.toJson()));

  //   final json = jsonDecode(response.body);
  //   return Person.fromJson(json);
  // }

  /// Send item serialized as json over http to server
  // @override
  // Future<Person?> update(Person item) async {
  //   Response response = await http.put(baseUri,
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode(item.toJson()));

  //   final json = jsonDecode(response.body);
  //   return Person.fromJson(json);
  // }

  // @override
  // Future<Person?> getById(int id) async {
  //   Response response = await http.get(
  //     createUriWithId(id),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   final json = jsonDecode(response.body);
  //   return Person.fromJson(json);
  // }

  // @override
  // Future<List<Person>> getAll() async {
  //   final response = await http.get(
  //     baseUri,
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   final json = jsonDecode(response.body);
  //   return (json as List).map((item) => Person.fromJson(item)).toList();
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
