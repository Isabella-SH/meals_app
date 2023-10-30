import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/services/meal_service.dart';

class MealList extends StatefulWidget {
  const MealList({super.key, required this.categoryName});

  //parametro
  final String categoryName;

  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {

  MealService? _mealService;
  List? _meals;

  initialize() async{
    //llama al metodo del servicio
    _meals=await _mealService?.getAll(widget.categoryName) ?? [];
    setState(() { //lo renderiza
      _meals=_meals;
    });
  }

  @override
  void initState(){
    _mealService=MealService(); //inicializa el servicio
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _meals?.length ??0,
        itemBuilder: (
            (context,index)=> MealItem(meal: _meals?[index])
        ),
      ),
    );
  }
}

class MealItem extends StatefulWidget {
  const MealItem({super.key, required this.meal});

  //parametro
  final Meal meal;

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  @override
  Widget build(BuildContext context) {

    final image=Image.network(widget.meal.imageUrl);

    return Card(
      child: ListTile(
          leading: image,
          title: Text(widget.meal.name),
          trailing: const Icon(Icons.favorite),
      ),
    );
  }
}








