import 'package:flutter/material.dart';
import 'package:recipe_book_app/model/recipes.dart';
import 'package:recipe_book_app/views/recipe_details/recipes_details.dart';

import '../../data/liked_recipe_service.dart';

class RecipeWidgets extends StatefulWidget {
  final Recipe? recipe;
  final bool? showLikedRecipe;

  const RecipeWidgets(
      {Key? key, required this.recipe, required this.showLikedRecipe})
      : super(key: key);

  @override
  State<RecipeWidgets> createState() => _RecipeWidgetsState();
}

class _RecipeWidgetsState extends State<RecipeWidgets> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => RecipesDetails(recipe:widget.recipe, name:widget.recipe!.name!),));
                    },
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
               children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  widget.recipe!.name!,
                  style:
                      const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ),
              
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: widget.recipe!.image != null
                        ? Image.network(
                            widget.recipe!.image!,
                            width: 400,
                            height: 200,
                          )
                        : Image.asset(
                            'assets/cheff.png' ,
                            width: 100,
                            height: 100,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Description:',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                        Text(widget.recipe!.description!)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text('Cook Time:   ',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                      Text( widget.recipe!.cookTime.toString(),style: const TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text('Preperation Time:   ',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                      Text( widget.recipe!.prepareTime.toString(),style: const TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      const Text('Servings:   ',style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),),
                      Text( widget.recipe!.servings.toString(),style: const TextStyle(fontSize: 20),),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      widget.showLikedRecipe! ? getLikedRecipe() : Container(),
                    ],
                  )
                          ],
                        )
                    ),
                  ),
              ),
    );
  }

  FutureBuilder<bool> getLikedRecipe() {
    return FutureBuilder(
        future: isRecipeLiked(widget.recipe!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var hasBookmark = snapshot.data ?? false;
            return IconButton(
                onPressed: (() async {
                  if (hasBookmark) {
                    await removeLikedRecipe(widget.recipe!);
                  } else {
                    await addLikedRecipe(widget.recipe!);
                  }
                  setState(() {});
                }),
                icon: Icon(
                  Icons.restaurant_menu_outlined,
                  color: hasBookmark ? Colors.red : Colors.grey,
                  size: 15,
                ));
          }
          return const CircularProgressIndicator();
        });
  }
}
