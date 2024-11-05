import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'network_repository.dart';

class ParkingSpaceRepository extends NetworkRepository<ParkingSpace> {
  // Singleton
  static final ParkingSpaceRepository _instance =
      ParkingSpaceRepository._internal();
  static ParkingSpaceRepository get instance => _instance;
  ParkingSpaceRepository._internal()
      : super(serializer: ParkingSpaceSerializer(), resource: "parkingspaces");

  // @override
  // Future<ParkingSpace?> create(ParkingSpace item) async {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<ParkingSpace?> update(ParkingSpace item) async {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<ParkingSpace?> getById(int id) async {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List<ParkingSpace>> getAll() {
  //   throw UnimplementedError();
  // }

  // @override
  // Future<bool> delete(int id) async {
  //   throw UnimplementedError();
  // }
}
