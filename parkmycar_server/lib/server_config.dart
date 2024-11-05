import 'package:shelf_router/shelf_router.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';
import 'handlers/parking_handler.dart';
import 'handlers/parking_space_handler.dart';
import 'handlers/person_handler.dart';
import 'handlers/vehicle_handler.dart';

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
    // /persons/<id>	      PUT	    Uppdatera specifik person	update()
    // /persons/<id>	      DELETE	Ta bort specifik person	delete()
    // /vehicles	          GET	    Hämta alla fordon	getAll()
    // /vehicles	          POST	  Skapa nytt fordon	create()
    // /vehicles/<id>	      GET	    Hämta specifikt fordon	getById()
    // /vehicles/<id>	      PUT	    Uppdatera specifikt fordon	update()
    // /vehicles/<id>	      DELETE	Ta bort specifikt fordon	delete()
    // /parkingspaces	      GET	    Hämta alla parkeringsplatser	getAll()
    // /parkingspaces	      POST	  Skapa ny parkeringsplats	create()
    // /parkingspaces/<id>	GET	    Hämta specifik parkeringsplats	getById()
    // /parkingspaces/<id>	PUT	    Uppdatera parkeringsplats	update()
    // /parkingspaces/<id>	DELETE	Ta bort parkeringsplats	delete()
    // /parkings	          GET	    Hämta alla parkeringar	getAll()
    // /parkings	          POST	  Skapa ny parkering	create()
    // /parkings/<id>	      GET	    Hämta specifik parkering	getById()
    // /parkings/<id>	      PUT	    Uppdatera specifik parkering	update()
    // /parkings/<id>	      DELETE	Ta bort specifik parkering	delete()

    router.get('/persons', getPersonsHandler); // get all persons
    router.post('/persons', postPersonHandler); // create a person
    router.get('/persons/<id|[0-9]+>', getPersonHandler); // get specific person
    router.put('/persons', updatePersonHandler); // update specific person
    router.delete(
        '/persons/<id|[0-9]+>', deletePersonHandler); // delete specific person

    router.post('/vehicles', postVehicleHandler); // create a vehicle
    router.get('/vehicles', getVehiclesHandler); // get all vehicle
    router.get(
        '/vehicles/<id|[0-9]+>', getVehicleHandler); // get specific vehicle
    router.put('/vehicles', updateVehicleHandler); // update specific vehicle
    router.delete('/vehicles/<id|[0-9]+>',
        deleteVehicleHandler); // delete specific vehicle

    router.post('/parkings', postParkingHandler); // create a parking
    router.get('/parkings', getParkingsHandler); // get all parking
    router.get(
        '/parkings/<id|[0-9]+>', getParkingHandler); // get specific parking
    router.put('/parkings', updateParkingHandler); // update specific parking
    router.delete('/parkings/<id|[0-9]+>',
        deleteParkingHandler); // delete specific parking

    router.post(
        '/parkingspaces', postParkingSpaceHandler); // create a parking_space
    router.get(
        '/parkingspaces', getParkingSpacesHandler); // get all parking_space
    router.get('/parkingspaces/<id|[0-9]+>',
        getParkingSpaceHandler); // get specific parking_space
    router.put('/parkingspaces',
        updateParkingSpaceHandler); // update specific parking_space
    router.delete('/parkingspaces/<id|[0-9]+>',
        deleteParkingSpaceHandler); // delete specific parking_space
  }
}
