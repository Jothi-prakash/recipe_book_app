import 'package:flutter/material.dart';
import 'package:recipe_book_app/views/liked_recipe/liked_recipe_page.dart';
import 'package:recipe_book_app/views/random_recipe/random_recipe_page.dart';
import 'package:recipe_book_app/views/search_recipe/search_recipe_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(getAppBarTitle())),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant), label: 'Recipe Book'),
          BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_menu), label: 'Liked Recipe'),
        ],
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
      ),
      body: getBottomBodyContent(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchRecipePage(),));
      },child: const Icon(Icons.search),),
    );
  }

  String getAppBarTitle() {
    switch (selectedIndex) {
      case 0:
        return 'Recipe Book';
      case 1:
        return 'Liked Recipe';
    }
    return 'Recipe Book';
  }

  Widget getBottomBodyContent() {
    switch (selectedIndex) {
      case 0:
        return const RandomRecipePage();
      case 1:
        return const LikedRecipePage();
          }
    return const HomeScreen();
  }
}
