import 'package:flutter/material.dart';
import 'package:recipe_book_app/data/random_recipe_service.dart';
import 'package:recipe_book_app/model/recipes.dart';
import 'package:recipe_book_app/views/widget/recipe_widget.dart';

class RandomRecipePage extends StatefulWidget {
  const RandomRecipePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RandomRecipePageState createState() => _RandomRecipePageState();
}

class _RandomRecipePageState extends State<RandomRecipePage> {
  @override
  Widget build(BuildContext context) {
    return getRecipeFuture();
  }
}

Widget getRecipeFuture() {
  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return getListView(snapshot.data);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: getRandomRecipe(),
  );
}

Widget getListView(Recipe? data) {
  if (data == null) {
    return const Center(
      child: Text('Error in getting data'),
    );
  }

  var recipeWidget = RecipeWidgets(
    recipe: data,
    showLikedRecipe: true,
  );

  return recipeWidget;
}
