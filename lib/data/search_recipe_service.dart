import 'package:dio/dio.dart';
import 'package:recipe_book_app/model/recipes.dart';
import 'package:recipe_book_app/model/search_recipes.dart';

Future<List<Recipe>> searchRecipeItems(SearchRecipe searchRecipeItem) async {
  var dio = Dio();
  var response = await dio.get(
      'https://low-carb-recipes.p.rapidapi.com/search?name=${searchRecipeItem.searchRecipe}',
      options: Options(headers: {
        'X-RapidAPI-Key': '5660d4afa6msh33b0a3a7619582fp1d8ad2jsn381fa2f7010c',
        'X-RapidAPI-Host': 'low-carb-recipes.p.rapidapi.com'
      }));

  if (response.statusCode == 200) {
    var searchItemJsons = response.data;
    var searchItemObj = MultipleRecipe.fromJson(searchItemJsons);
    return searchItemObj.recipes;
  }
  return <Recipe>[];
}
