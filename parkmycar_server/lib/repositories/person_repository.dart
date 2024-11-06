import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'db_repository.dart';

class PersonRepository extends DbRepository<Person> {
  // Singleton
  static final PersonRepository _instance = PersonRepository._internal();
  PersonRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static PersonRepository get instance => _instance;
}
