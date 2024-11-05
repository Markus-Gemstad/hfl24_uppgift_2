import 'package:parkmycar_shared/parkmycar_shared.dart';

import 'db_repository.dart';

class ParkingRepository extends DbRepository<Parking> {
  // Singleton
  static final ParkingRepository _instance = ParkingRepository._internal();
  ParkingRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static ParkingRepository get instance => _instance;
}
