import 'package:parkmycar_server/server_config.dart';
import 'package:parkmycar_shared/parkmycar_shared.dart';

class DbRepository<T extends Identifiable> implements RepositoryInterface<T> {
  Box<T> box = ServerConfig.instance.store.box<T>();

  @override
  Future<T?> create(T item) async {
    item.id = box.put(item, mode: PutMode.insert);
    return item;
  }

  @override
  Future<T?> update(T item) async {
    item.id = box.put(item, mode: PutMode.update);
    return item;
  }

  @override
  Future<T?> getById(int id) async {
    return box.get(id);
  }

  @override
  Future<List<T>> getAll() async {
    return box.getAll();
  }

  @override
  Future<bool> delete(int id) async {
    return box.remove(id);
  }
}
