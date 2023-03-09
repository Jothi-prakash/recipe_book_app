import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:recipe_book_app/model/recipes.dart';

import '../data/random_recipe_service.dart';

var fileName = 'Recipes.json';

Future<String> getFullFilePath() async {
  var appDirectory = (await getApplicationDocumentsDirectory()).path;
  return '$appDirectory/$fileName';
}

Future<List<Recipe>> getRandomRecipes() async {
  // get the full file path of today's headline json
  var fullFilePath = await getFullFilePath();
  //construct a file object based on the above file path
  var fileObj = File(fullFilePath);
  //chech if file exists
  if (fileObj.existsSync()) {
    // read file as string
    var jsonString = fileObj.readAsStringSync();
    //convert string to json
    var jsonObj = jsonDecode(jsonString);
    // convert json to news headlines
    var randomRecipes = MultipleRecipe.fromJson(jsonObj);
    //return list of articles
    return randomRecipes.recipes;
  }

  // call API to get a response
  var response = await dio.get('https://low-carb-recipes.p.rapidapi.com/random',
      options: Options(headers: {
        'X-RapidAPI-Key': '5660d4afa6msh33b0a3a7619582fp1d8ad2jsn381fa2f7010c',
        'X-RapidAPI-Host': 'low-carb-recipes.p.rapidapi.com'
      }));

  if (response.statusCode == 200) {
    //get the json object
    var jsonObj = response.data;
    //covert json to string
    var jsonString = jsonEncode(jsonObj);
    //write the contents to file
    fileObj.writeAsStringSync(jsonString);
    // convert json to news headlines
    var randomRecipes = MultipleRecipe.fromJson(jsonObj);
    //return list of articles
    return randomRecipes.recipes;
  }

  //return list iof articles
  return <Recipe>[];
}
