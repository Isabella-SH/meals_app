import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/repositories/meal_repository.dart';
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

  //atributos
  bool _favorite=false;
  MealRepository? _mealRepository;

  initialize()async{
    //_favorite toma el valor que da el metodo del repositorie al pasarle cada entidad
    _favorite=await _mealRepository?.isFavorite(widget.meal)??false;
    if (mounted){ //si ya se cargo toda la informacion
      setState(() {
        _favorite=_favorite;
      });
    }
  }

  @override
  void initState(){
    _mealRepository=MealRepository();
    initialize();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    final image=Image.network(widget.meal.imageUrl);
    final my_con= _favorite? const Icon(
      Icons.favorite,color:Colors.red,
    ):const Icon(
      Icons.favorite,color:Colors.grey,
    );

    return Card(
      child: ListTile(
          leading: image,
          title: Text(widget.meal.name),
          trailing: IconButton(
              icon: my_con,
              //dentro del click
              onPressed: (){
                //_favorite cambia
                setState(() {
                  _favorite=!_favorite;
                });
                //se agrega o elimina del repository
                 //si es true lo insert, sino lo elimina
                _favorite?_mealRepository?.insert(widget.meal):_mealRepository?.delete(widget.meal);
              },
          ),
      ),
    );
  }
}








