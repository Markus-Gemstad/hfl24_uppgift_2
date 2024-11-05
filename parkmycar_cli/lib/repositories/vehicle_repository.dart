import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'network_repository.dart';

class VehicleRepository extends NetworkRepository<Vehicle> {
  // Singleton
  static final VehicleRepository _instance = VehicleRepository._internal();
  static VehicleRepository get instance => _instance;
  VehicleRepository._internal()
      : super(serializer: VehicleSerializer(), resource: "vehicles");
}
