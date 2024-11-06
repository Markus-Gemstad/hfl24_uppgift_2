import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'db_repository.dart';

class VehicleRepository extends DbRepository<Vehicle> {
  // Singleton
  static final VehicleRepository _instance = VehicleRepository._internal();
  VehicleRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static VehicleRepository get instance => _instance;
}
