import 'dart:convert';
import 'dart:developer';
import 'dart:io';                               //importar .io
import 'package:http/http.dart' as http;
import 'package:meals_app/models/meal.dart';

class CategoryService{
  //https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood=nombre_categoria
  String baseUrl="https://www.themealdb.com/api/json/v1/1/filter.php?c=";

  //devuelve en algun momento una lista
  Future<List> getAll(String categoryName) async{
    //concatena un dato a la baseurl
    final http.Response response=await http.get(Uri.parse('$baseUrl$categoryName'));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);
      //crea una lista llamada maps que recoge tod de categories
      final List meals=jsonResponse["meals"];
      //cada map es asignado a un objeto usando su metodo de fromJson
      return meals.map((e) => Meal.fromJson(e)).toList();
    }
    return []; //retorna un arreglo vacio
  }
}








