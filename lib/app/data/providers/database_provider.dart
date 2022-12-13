import 'package:hive_flutter/hive_flutter.dart';

class DatabaseProvider {
  DatabaseProvider._privateConstructor();
  static final DatabaseProvider instance = DatabaseProvider._privateConstructor();

  Box? _box;

  Future<void> hiveBoxInitialization<E>(
    TypeAdapter<E> adapter,
    String? path,
    String boxName,
  ) async {
    instance._initDatabse(path);
    instance._registerAdapter<E>(adapter);
    await instance._openBox<E>(boxName);
    instance._initBox<E>(boxName);
  }

  void _initDatabse(String? path) async {
    Hive.init(path);
    await Hive.initFlutter(path);
  }

  void _registerAdapter<E>(TypeAdapter<E> adapter) =>
      Hive.registerAdapter<E>(adapter);

  Future<Box<E>> _openBox<E>(String name) => Hive.openBox<E>(name);

  void _initBox<E>(String name) => _box = Hive.box<E>(name);

  List<T> getAll<T>() => _box!.values.toList() as List<T>;

  void add<E>(E value) => instance._box!.add(value);
}
