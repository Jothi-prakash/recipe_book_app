import 'package:flutter/material.dart';
import 'package:recipe_book_app/model/recipes.dart';


class RecipesDetails extends StatefulWidget {
    final Recipe? recipe;
      final String? name;
  const RecipesDetails({ Key? key ,required this.recipe,required this.name}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RecipesDetailsState createState() => _RecipesDetailsState();
}

class _RecipesDetailsState extends State<RecipesDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name!),
      ),
      body:Row(
        children: [
          Column(mainAxisSize: MainAxisSize.min, children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.recipe!.name!,
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: widget.recipe!.image != null
                      ? Image.network(
                          widget.recipe!.image!,
                          width: 100,
                          height: 100,
                        )
                      : Image.asset(
                          'assets/cheff.png' ,
                          width: 250,
                          height: 250,
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.recipe!.description!,
                    style:
                        const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.recipe!.cookTime.toString(),
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.recipe!.prepareTime.toString(),
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.recipe!.servings.toString(),
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
          ]
          ),
        ],
      )
      
    );
  }
}