import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:recipe_book_app/model/recipes.dart';

var fileName = 'likedRecipe.json';

Future<String> getFullFilePath() async {
  var appDirectory = (await getApplicationDocumentsDirectory()).path;
  return '$appDirectory/$fileName';
}

Future<List<Recipe>> getLikedRecipe() async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  if (fileObj.existsSync()) {
    var jsonString = fileObj.readAsStringSync();
    var jsonObjs = jsonDecode(jsonString) as List;

    return jsonObjs.map((e) {
      return Recipe.fromJson(e);
    }).toList();
  }
  return <Recipe>[];
}

Future<bool> isRecipeLiked(Recipe recipe) async {
  var allLikedRecipes = await getLikedRecipe();
  var likedRecipeExists =
      allLikedRecipes.any((element) => recipe.id == element.id);
  return likedRecipeExists;
}

Future<bool> doesLikedRecipeExists() async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  return fileObj.existsSync();
}

Future<bool> addLikedRecipe(Recipe recipe) async {
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  var likedRecipe = await getLikedRecipe();
  likedRecipe.add(recipe);

  var likedRecipeAsString = jsonEncode(likedRecipe);
  fileObj.writeAsStringSync(likedRecipeAsString);
  return true;
}

Future<bool> removeLikedRecipe(Recipe recipe) async {
  var likedRecipe = await getLikedRecipe();

  likedRecipe.removeWhere((element) => element.id == recipe.id);

  var likedRecipeAsString = jsonEncode(likedRecipe);
  var fullFilePath = await getFullFilePath();
  var fileObj = File(fullFilePath);
  fileObj.writeAsStringSync(likedRecipeAsString);
  return true;
}
