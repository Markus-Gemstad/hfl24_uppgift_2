import 'network_repository.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';

class ParkingRepository extends NetworkRepository<Parking> {
  // Singleton
  static final ParkingRepository _instance = ParkingRepository._internal();
  static ParkingRepository get instance => _instance;
  ParkingRepository._internal()
      : super(serializer: ParkingSerializer(), resource: "parkings");
}
