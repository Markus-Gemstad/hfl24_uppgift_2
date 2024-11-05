// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again
// with `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'
    as obx_int; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart' as obx;

import 'models/parking.dart';
import 'models/parking_space.dart';
import 'models/person.dart';
import 'models/vehicle.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <obx_int.ModelEntity>[
  obx_int.ModelEntity(
      id: const obx_int.IdUid(1, 3159915504888629933),
      name: 'Parking',
      lastPropertyId: const obx_int.IdUid(5, 3851179708096289757),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1122029913329078176),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7742266671588932223),
            name: 'vehicleId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 7246320551606769979),
            name: 'parkingSpaceId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(4, 2208202435347410567),
            name: 'startTime',
            type: 10,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 3851179708096289757),
            name: 'endTime',
            type: 10,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(2, 3209442784994431873),
      name: 'ParkingSpace',
      lastPropertyId: const obx_int.IdUid(3, 8360833968272719910),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 4245361613086671350),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 7944412946557532700),
            name: 'address',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 8360833968272719910),
            name: 'pricePerHour',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(3, 7947584470642019838),
      name: 'Person',
      lastPropertyId: const obx_int.IdUid(3, 1775133219292169484),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 8444713727083868267),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 1539297726348085044),
            name: 'name',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 1775133219292169484),
            name: 'personnr',
            type: 9,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[]),
  obx_int.ModelEntity(
      id: const obx_int.IdUid(4, 8205734843439185810),
      name: 'Vehicle',
      lastPropertyId: const obx_int.IdUid(5, 5762263165316166057),
      flags: 0,
      properties: <obx_int.ModelProperty>[
        obx_int.ModelProperty(
            id: const obx_int.IdUid(1, 1519331793205901949),
            name: 'id',
            type: 6,
            flags: 1),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(2, 6423205344317961372),
            name: 'regNr',
            type: 9,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(3, 49804698990703467),
            name: 'personId',
            type: 6,
            flags: 0),
        obx_int.ModelProperty(
            id: const obx_int.IdUid(5, 5762263165316166057),
            name: 'dbType',
            type: 6,
            flags: 0)
      ],
      relations: <obx_int.ModelRelation>[],
      backlinks: <obx_int.ModelBacklink>[])
];

/// Shortcut for [obx.Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [obx.Store.new] for an explanation of all parameters.
///
/// For Flutter apps, also calls `loadObjectBoxLibraryAndroidCompat()` from
/// the ObjectBox Flutter library to fix loading the native ObjectBox library
/// on Android 6 and older.
obx.Store openStore(
    {String? directory,
    int? maxDBSizeInKB,
    int? maxDataSizeInKB,
    int? fileMode,
    int? maxReaders,
    bool queriesCaseSensitiveDefault = true,
    String? macosApplicationGroup}) {
  return obx.Store(getObjectBoxModel(),
      directory: directory,
      maxDBSizeInKB: maxDBSizeInKB,
      maxDataSizeInKB: maxDataSizeInKB,
      fileMode: fileMode,
      maxReaders: maxReaders,
      queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
      macosApplicationGroup: macosApplicationGroup);
}

/// Returns the ObjectBox model definition for this project for use with
/// [obx.Store.new].
obx_int.ModelDefinition getObjectBoxModel() {
  final model = obx_int.ModelInfo(
      entities: _entities,
      lastEntityId: const obx_int.IdUid(4, 8205734843439185810),
      lastIndexId: const obx_int.IdUid(0, 0),
      lastRelationId: const obx_int.IdUid(0, 0),
      lastSequenceId: const obx_int.IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [5260316842041756690],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, obx_int.EntityDefinition>{
    Parking: obx_int.EntityDefinition<Parking>(
        model: _entities[0],
        toOneRelations: (Parking object) => [],
        toManyRelations: (Parking object) => {},
        getId: (Parking object) => object.id,
        setId: (Parking object, int id) {
          object.id = id;
        },
        objectToFB: (Parking object, fb.Builder fbb) {
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.vehicleId);
          fbb.addInt64(2, object.parkingSpaceId);
          fbb.addInt64(3, object.startTime.millisecondsSinceEpoch);
          fbb.addInt64(4, object.endTime.millisecondsSinceEpoch);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final vehicleIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0);
          final parkingSpaceIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final startTimeParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0));
          final endTimeParam = DateTime.fromMillisecondsSinceEpoch(
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = Parking(vehicleIdParam, parkingSpaceIdParam,
              startTimeParam, endTimeParam, idParam);

          return object;
        }),
    ParkingSpace: obx_int.EntityDefinition<ParkingSpace>(
        model: _entities[1],
        toOneRelations: (ParkingSpace object) => [],
        toManyRelations: (ParkingSpace object) => {},
        getId: (ParkingSpace object) => object.id,
        setId: (ParkingSpace object, int id) {
          object.id = id;
        },
        objectToFB: (ParkingSpace object, fb.Builder fbb) {
          final addressOffset = fbb.writeString(object.address);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, addressOffset);
          fbb.addInt64(2, object.pricePerHour);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final addressParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final pricePerHourParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = ParkingSpace(addressParam, pricePerHourParam, idParam);

          return object;
        }),
    Person: obx_int.EntityDefinition<Person>(
        model: _entities[2],
        toOneRelations: (Person object) => [],
        toManyRelations: (Person object) => {},
        getId: (Person object) => object.id,
        setId: (Person object, int id) {
          object.id = id;
        },
        objectToFB: (Person object, fb.Builder fbb) {
          final nameOffset = fbb.writeString(object.name);
          final personnrOffset = fbb.writeString(object.personnr);
          fbb.startTable(4);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, nameOffset);
          fbb.addOffset(2, personnrOffset);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final nameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final personnrParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final idParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final object = Person(nameParam, personnrParam, idParam);

          return object;
        }),
    Vehicle: obx_int.EntityDefinition<Vehicle>(
        model: _entities[3],
        toOneRelations: (Vehicle object) => [],
        toManyRelations: (Vehicle object) => {},
        getId: (Vehicle object) => object.id,
        setId: (Vehicle object, int id) {
          object.id = id;
        },
        objectToFB: (Vehicle object, fb.Builder fbb) {
          final regNrOffset = fbb.writeString(object.regNr);
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addOffset(1, regNrOffset);
          fbb.addInt64(2, object.personId);
          fbb.addInt64(4, object.dbType);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (obx.Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final regNrParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final personIdParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0);
          final object = Vehicle(regNrParam, personIdParam)
            ..id = const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0)
            ..dbType = const fb.Int64Reader()
                .vTableGetNullable(buffer, rootOffset, 12);

          return object;
        })
  };

  return obx_int.ModelDefinition(model, bindings);
}

/// [Parking] entity fields to define ObjectBox queries.
class Parking_ {
  /// See [Parking.id].
  static final id =
      obx.QueryIntegerProperty<Parking>(_entities[0].properties[0]);

  /// See [Parking.vehicleId].
  static final vehicleId =
      obx.QueryIntegerProperty<Parking>(_entities[0].properties[1]);

  /// See [Parking.parkingSpaceId].
  static final parkingSpaceId =
      obx.QueryIntegerProperty<Parking>(_entities[0].properties[2]);

  /// See [Parking.startTime].
  static final startTime =
      obx.QueryDateProperty<Parking>(_entities[0].properties[3]);

  /// See [Parking.endTime].
  static final endTime =
      obx.QueryDateProperty<Parking>(_entities[0].properties[4]);
}

/// [ParkingSpace] entity fields to define ObjectBox queries.
class ParkingSpace_ {
  /// See [ParkingSpace.id].
  static final id =
      obx.QueryIntegerProperty<ParkingSpace>(_entities[1].properties[0]);

  /// See [ParkingSpace.address].
  static final address =
      obx.QueryStringProperty<ParkingSpace>(_entities[1].properties[1]);

  /// See [ParkingSpace.pricePerHour].
  static final pricePerHour =
      obx.QueryIntegerProperty<ParkingSpace>(_entities[1].properties[2]);
}

/// [Person] entity fields to define ObjectBox queries.
class Person_ {
  /// See [Person.id].
  static final id =
      obx.QueryIntegerProperty<Person>(_entities[2].properties[0]);

  /// See [Person.name].
  static final name =
      obx.QueryStringProperty<Person>(_entities[2].properties[1]);

  /// See [Person.personnr].
  static final personnr =
      obx.QueryStringProperty<Person>(_entities[2].properties[2]);
}

/// [Vehicle] entity fields to define ObjectBox queries.
class Vehicle_ {
  /// See [Vehicle.id].
  static final id =
      obx.QueryIntegerProperty<Vehicle>(_entities[3].properties[0]);

  /// See [Vehicle.regNr].
  static final regNr =
      obx.QueryStringProperty<Vehicle>(_entities[3].properties[1]);

  /// See [Vehicle.personId].
  static final personId =
      obx.QueryIntegerProperty<Vehicle>(_entities[3].properties[2]);

  /// See [Vehicle.dbType].
  static final dbType =
      obx.QueryIntegerProperty<Vehicle>(_entities[3].properties[3]);
}
