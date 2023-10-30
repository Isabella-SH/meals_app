import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            (context,index)=> Card(
                child: Text(_meals?[index].name ?? '')
            )
        ),
      ),
    );
  }
}







