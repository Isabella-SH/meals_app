import 'dart:convert';
import 'dart:developer';
import 'dart:io';                               //importar .io
import 'package:http/http.dart' as http;

import '../models/category.dart';

class CategoryService{

  String baseUrl="https://www.themealdb.com/api/json/v1/1/categories.php";

  //devuelve en algun momento una lista
  Future<List> getAll() async{

    final http.Response response=await http.get(Uri.parse(baseUrl));

    //si la respuesta devuelve algo
    if(response.statusCode==HttpStatus.ok){

      //ver que devuelve el servicio al ejecutar(solo para probar)
      log(response.body);

      //es la respuesta de tod el json
      final jsonResponse=json.decode(response.body);
      //crea una lista llamada maps que recoge tod de categories
      final List maps=jsonResponse["categories"];

      //cada map es asignado a un objeto usando su metodo de fromJson
      return maps.map((e) => Category.fromJson(e)).toList();
    }
    return []; //retorna un arreglo vacio
  }
}








