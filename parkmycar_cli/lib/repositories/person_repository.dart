import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'network_repository.dart';

class PersonRepository extends NetworkRepository<Person> {
  // Singleton
  static final PersonRepository _instance = PersonRepository._internal();
  static PersonRepository get instance => _instance;
  PersonRepository._internal()
      : super(serializer: PersonSerializer(), resource: "persons");
}
