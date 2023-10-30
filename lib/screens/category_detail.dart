
import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meal_list.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({super.key, required this.category});

  //parametro
  final Category category;

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {

  @override
  Widget build(BuildContext context) {

    final image=Image.network(widget.category.imageUrl);
    final width=MediaQuery.of(context).size.width;

    return Scaffold(
      body: NestedScrollView(

                       //ESTA ES LA CABECERA
        headerSliverBuilder: (context, innBoxIsScrolled){
          return [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.category.name),
                background: Hero(
                  tag: widget.category.id,
                  child: image,
                ),
              ),
            )
          ];
        },

                          //ESTA ES EL CUERPO
        body: Column(
          children: [
            SizedBox(
              width: width,  //para que ocupe tod el ancho

              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.category.description),
                ),
              ),
            ),
            Expanded(
                child: MealList(categoryName: widget.category.name)
            ),
          ],
        )
      ),
    );
  }
}





