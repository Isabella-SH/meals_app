import 'package:flutter/cupertino.dart';

class Category{

  final String id;
  final String name;
  final String description;
  final String imageUrl;

  //constructor
  const Category(
      {
        required this.id,
        required this.name,
        required this.description,
        required this.imageUrl,
      }
  );

  //genera un objeto travez de un json
  Category.fromJson(Map<String, dynamic>json):
      id=json['idCategory'],
      name=json['strCategory'],
      description=json['strCategoryDescription'],
      imageUrl=json['strCategoryThumb'];

}


