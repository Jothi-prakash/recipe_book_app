import 'package:flutter/material.dart';
import 'package:recipe_book_app/views/home_page.dart';

class RecipeBook extends StatelessWidget {
const RecipeBook({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipe Book',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home:const  HomePage(),
    );
  }
}