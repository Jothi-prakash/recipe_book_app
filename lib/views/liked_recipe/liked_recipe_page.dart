
import 'package:flutter/material.dart';
import 'package:recipe_book_app/data/liked_recipe_service.dart';
import 'package:recipe_book_app/model/recipes.dart';
import 'package:recipe_book_app/views/widget/recipe_widget.dart';

class LikedRecipePage extends StatefulWidget {
  const LikedRecipePage({Key? key}) : super(key: key);

  @override
  State<LikedRecipePage> createState() => _LikedRecipePageState();
}

class _LikedRecipePageState extends State<LikedRecipePage> {
  @override
  Widget build(BuildContext context) {
    return getLikedRecipeFuture();
  }
}

Widget getLikedRecipeFuture() {
  return FutureBuilder(
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return getListView(snapshot.data);
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    },
    future: getLikedRecipe(),
  );
}

Widget getListView(List<Recipe>? data) {
  if (data == null || data.isEmpty) {
    return const Center(
      child: Text('There are no Liked Recipes.'),
    );
  }

  var likedRecipeWidgets = <Widget>[];
  for (var likedRecipe in data) {
    var likedRecipeWidget = RecipeWidgets(
      recipe: likedRecipe,
      showLikedRecipe: false,
    );
    likedRecipeWidgets.add(likedRecipeWidget);
  }

  return ListView(children: likedRecipeWidgets);
}
