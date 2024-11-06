import 'package:parkmycar_shared/parkmycar_shared.dart';

import 'db_repository.dart';

class ParkingSpaceRepository extends DbRepository<ParkingSpace> {
  // Singleton
  static final ParkingSpaceRepository _instance =
      ParkingSpaceRepository._internal();
  ParkingSpaceRepository._internal(); // Privat konstruktor förhindrar att fler objekt av klassen skapas
  static ParkingSpaceRepository get instance => _instance;
}
