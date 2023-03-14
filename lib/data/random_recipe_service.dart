import 'package:dio/dio.dart';
import 'package:recipe_book_app/model/recipes.dart';

var dio = Dio();
Future<Recipe?> getRandomRecipe() async {
var response = await dio.get('https://low-carb-recipes.p.rapidapi.com/random',
      options: Options(headers: {
        'X-RapidAPI-Key': '5660d4afa6msh33b0a3a7619582fp1d8ad2jsn381fa2f7010c',
        'X-RapidAPI-Host': 'low-carb-recipes.p.rapidapi.com'
      }));

  if (response.statusCode == 200) {
    var recipeJsons = response.data;
    var randomRecipeObj = Recipe.fromJson(recipeJsons);
    return randomRecipeObj;
  }
  return null;
}
