import 'network_repository.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';

class ParkingRepository extends NetworkRepository<Parking> {
  // Singleton
  static final ParkingRepository _instance = ParkingRepository._internal();
  static ParkingRepository get instance => _instance;
  ParkingRepository._internal()
      : super(serializer: ParkingSerializer(), resource: "parkings");

  // @override
  // Future<Parking?> create(Parking item) async {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Parking?> update(Parking item) async {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<Parking?> getById(int id) async {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List<Parking>> getAll() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<bool> delete(int id) async {
  //   throw UnimplementedError();
  // }
}
