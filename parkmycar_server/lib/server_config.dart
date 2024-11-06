import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'handlers/item_handler.dart';
import 'repositories/db_repository.dart';

class ServerConfig {
  // singleton constructor
  ServerConfig._privateConstructor() {
    initialize();
  }

  static final ServerConfig _instance = ServerConfig._privateConstructor();
  static ServerConfig get instance => _instance;

  late Store store;
  late Router router;

  initialize() {
    store = openStore();

    // Configure routes.
    router = Router();

    // Route	              Metod  	Beskrivning	Repository-metod
    // ---------------------------------------------------------
    // /persons	            GET	    Hämta alla personer	getAll()
    // /persons	            POST	  Skapa ny person	create()
    // /persons/<id>	      GET	    Hämta specifik person	getById()
    // /persons     	      PUT	    Uppdatera specifik person	update()
    // /persons/<id>	      DELETE	Ta bort specifik person	delete()
    // /vehicles	          GET	    Hämta alla fordon	getAll()
    // /vehicles	          POST	  Skapa nytt fordon	create()
    // /vehicles/<id>	      GET	    Hämta specifikt fordon	getById()
    // /vehicles            PUT	    Uppdatera specifikt fordon	update()
    // /vehicles/<id>	      DELETE	Ta bort specifikt fordon	delete()
    // /parkingspaces	      GET	    Hämta alla parkeringsplatser	getAll()
    // /parkingspaces	      POST	  Skapa ny parkeringsplats	create()
    // /parkingspaces/<id>	GET	    Hämta specifik parkeringsplats	getById()
    // /parkingspaces       PUT	    Uppdatera parkeringsplats	update()
    // /parkingspaces/<id>	DELETE	Ta bort parkeringsplats	delete()
    // /parkings	          GET	    Hämta alla parkeringar	getAll()
    // /parkings	          POST	  Skapa ny parkering	create()
    // /parkings/<id>	      GET	    Hämta specifik parkering	getById()
    // /parkings            PUT	    Uppdatera specifik parkering	update()
    // /parkings/<id>	      DELETE	Ta bort specifik parkering	delete()

    router.get(
        '/persons',
        (Request r) =>
            getAllItemsHandler(r, DbRepository<Person>(), PersonSerializer()));
    router.post(
        '/persons',
        (Request r) =>
            createItemHandler(r, DbRepository<Person>(), PersonSerializer()));
    router.get(
        '/persons/<id|[0-9]+>',
        (Request r, String id) =>
            getItemHandler(r, id, DbRepository<Person>(), PersonSerializer()));
    router.put(
        '/persons',
        (Request r) =>
            updateItemHandler(r, DbRepository<Person>(), PersonSerializer()));
    router.delete(
        '/persons/<id|[0-9]+>',
        (Request r, String id) => deleteItemHandler(
            r, id, DbRepository<Person>(), PersonSerializer()));

    router.get(
        '/vehicles',
        (Request r) => getAllItemsHandler(
            r, DbRepository<Vehicle>(), VehicleSerializer()));
    router.post(
        '/vehicles',
        (Request r) =>
            createItemHandler(r, DbRepository<Vehicle>(), VehicleSerializer()));
    router.get(
        '/vehicles/<id|[0-9]+>',
        (Request r, String id) => getItemHandler(
            r, id, DbRepository<Vehicle>(), VehicleSerializer()));
    router.put(
        '/vehicles',
        (Request r) =>
            updateItemHandler(r, DbRepository<Vehicle>(), VehicleSerializer()));
    router.delete(
        '/vehicles/<id|[0-9]+>',
        (Request r, String id) => deleteItemHandler(
            r, id, DbRepository<Vehicle>(), VehicleSerializer()));

    router.get(
        '/parkings',
        (Request r) => getAllItemsHandler(
            r, DbRepository<Parking>(), ParkingSerializer()));
    router.post(
        '/parkings',
        (Request r) =>
            createItemHandler(r, DbRepository<Parking>(), ParkingSerializer()));
    router.get(
        '/parkings/<id|[0-9]+>',
        (Request r, String id) => getItemHandler(
            r, id, DbRepository<Parking>(), ParkingSerializer()));
    router.put(
        '/parkings',
        (Request r) =>
            updateItemHandler(r, DbRepository<Parking>(), ParkingSerializer()));
    router.delete(
        '/parkings/<id|[0-9]+>',
        (Request r, String id) => deleteItemHandler(
            r, id, DbRepository<Parking>(), ParkingSerializer()));

    router.get(
        '/parkingspaces',
        (Request r) => getAllItemsHandler(
            r, DbRepository<ParkingSpace>(), ParkingSpaceSerializer()));
    router.post(
        '/parkingspaces',
        (Request r) => createItemHandler(
            r, DbRepository<ParkingSpace>(), ParkingSpaceSerializer()));
    router.get(
        '/parkingspaces/<id|[0-9]+>',
        (Request r, String id) => getItemHandler(
            r, id, DbRepository<ParkingSpace>(), ParkingSpaceSerializer()));
    router.put(
        '/parkingspaces',
        (Request r) => updateItemHandler(
            r, DbRepository<ParkingSpace>(), ParkingSpaceSerializer()));
    router.delete(
        '/parkingspaces/<id|[0-9]+>',
        (Request r, String id) => deleteItemHandler(
            r, id, DbRepository<ParkingSpace>(), ParkingSpaceSerializer()));
  }
}
