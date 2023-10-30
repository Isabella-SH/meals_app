import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/category_detail.dart';
import 'package:meals_app/services/category_service.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  CategoryService? _categoryService;
  List? _categories;

  initialize()async{
    //llama al metodo del servicio
    _categories=await _categoryService?.getAll() ??[];
    setState(() { //lo renderiza
      _categories=_categories;
    });
  }

  @override
  void initState(){
    _categoryService=CategoryService(); //inicializa el servicio
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), //muetsra 2 columnas
        itemCount:_categories?.length??0, //asigna el tamaño, sino hay le coloca 0
        itemBuilder: (context, index){
          return CategoryItem(category: _categories?[index]);
        }
      ),
    );
  }
}

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.category});

  //parametros
  final Category category;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {

    //defino la imagen
    final image=Image.network(widget.category.imageUrl);

    return GestureDetector(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CategoryDetail(category: widget.category);
           }
          )
        );
      },

      child: Card(
        child: Column(
          children: [
            Hero(
              tag: widget.category.id,
              child: image,
            ),
            Text(widget.category.name),
          ],
        ),
      ),
    );
  }
}









