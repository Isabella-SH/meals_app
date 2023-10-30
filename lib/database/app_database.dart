import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase{

  final int version=1;
  final String databaseName="Meals.db";
  //se pueden crear mas tablas
  final String tableName="meals";

  Database? _db;

  //funcion patra la creacion de nuetsra base de datos
  Future<Database> openDb()async{
    //abrir el directorio donde estan las databases y lo uno con el nombre de nuestra base se datos
    _db ??= await openDatabase(join(await getDatabasesPath(), databaseName),
        onCreate: (database, version){
          database.execute("create table $tableName (id text primary key, name text)");
        }, version: version
    );
    return _db as Database;
  }
}






