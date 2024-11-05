import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'network_repository.dart';

class ParkingSpaceRepository extends NetworkRepository<ParkingSpace> {
  // Singleton
  static final ParkingSpaceRepository _instance =
      ParkingSpaceRepository._internal();
  static ParkingSpaceRepository get instance => _instance;
  ParkingSpaceRepository._internal()
      : super(serializer: ParkingSpaceSerializer(), resource: "parkingspaces");
}
