import 'package:meals_app/database/app_database.dart';
import 'package:meals_app/models/meal.dart';
import 'package:sqflite/sqflite.dart';

class MealRepository{

  //insertar
  Future insert(Meal meal) async{
    Database db= await AppDatabase().openDb();
    //metodo de pokemon.dart
    await db.insert(AppDatabase().tableName, meal.toMap());
  }

  //eliminar
  Future delete(Meal meal) async{
    Database db= await AppDatabase().openDb();
    //metodo de la entidad
    await db.delete(AppDatabase().tableName,
        where: "id=?", whereArgs:[meal.id]);
  }

  //devuelve si una entidad esta marcada o no como favorita
  Future<bool> isFavorite(Meal meal) async{
    Database db= await AppDatabase().openDb();
    //metodo de la entidad
    List maps=await db.query(AppDatabase().tableName,
        where: "id=?", whereArgs: [meal.id]);

    //maps esta lleno es true, por eso el "isNotEmpty"
    return maps.isNotEmpty;  //devuelve si cierta entidad es o no favorita(se gusrdo o no en el database)
  }
}





