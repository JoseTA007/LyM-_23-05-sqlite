import 'package:sqflite/sqflite.dart';
import 'package:lym_proyect/UI/base_datos/registro_clientes.dart';
import 'package:path/path.dart';

class DB {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'clientes.db'),
        onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE clientes (id INTEGER PRIMARY KEY, nombre TEXT, apellidos TEXT, contrasena TEXT, comfirmarContrasena TEXT, dni TEXT, eMail TEXT)",
      );
    }, version: 3);
  }

  static Future<Future<void>> insert(Cliente cliente) async {
    Database database = await _openDB();
    return database.insert("clientes", cliente.toMap());
  }

  static Future<Future<void>> delete(Cliente cliente) async {
    Database database = await _openDB();
    return database.delete("clientes", where: "id= ?", whereArgs: [cliente.id]);
  }

  static Future<Future<void>> update(Cliente cliente) async {
    Database database = await _openDB();
    return database.update("clientes", cliente.toMap(),
        where: "id=?", whereArgs: [cliente.id]);
  }

  static Future<List<Cliente>> cliente() async {
    Database database = await _openDB();
    final List<Map<String, dynamic>> clienteMap =
        await database.query("clientes");
    return List.generate(
        clienteMap.length,
        (i) => Cliente(
              id: clienteMap[i]['id'],
              nombre: clienteMap[i]['nombre'],
              apellidos: clienteMap[i]['apellidos'],
              contrasena: clienteMap[i]['contrasena'],
              comfirmarContrasena: clienteMap[i]['comfirmarContrasena'],
              dni: clienteMap[i]['dni'],
              eMail: clienteMap[i]['eMail'],
            ));
  }
}
