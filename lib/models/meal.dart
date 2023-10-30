import 'package:flutter/cupertino.dart';

class Meal{

  final String id;
  final String name;
  final String imageUrl;

  //constructor
  const Meal(
      {
        required this.id,
        required this.name,
        required this.imageUrl,
      }
  );

  //genera un objeto travez de un json
  Meal.fromJson(Map<String, dynamic>json):
        id=json['idMeal'],
        name=json['strMeal'],
        imageUrl=json['strMealThumb'];

  //retorna un mapa con los datos que se tenga en esta clase
  //para el repository
  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'name':name,
    };
  }

}


