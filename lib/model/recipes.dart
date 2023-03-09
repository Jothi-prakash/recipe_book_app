class MultipleRecipe {
  MultipleRecipe({
     required this.recipes,
  });

 
  final List<Recipe> recipes;

  factory MultipleRecipe.fromJson(List<dynamic> json) {
    
    return MultipleRecipe(
      
      recipes:json.map((x) => Recipe.fromJson(x)).toList(),
    );
  }
}
class Recipe {
    Recipe({
        required this.id,
        required this.name,
        required this.tags,
        required this.description,
        required this.prepareTime,
        required this.cookTime,
        required this.ingredients,
        required this.steps,
        required this.servings,
        required this.servingSizes,
        required this.nutrients,
        required this.image,
    });

    final String? id;
    final String? name;
    final List<String> tags;
    final String? description;
    final int? prepareTime;
    final int? cookTime;
    final List<Ingredient> ingredients;
    final List<String> steps;
    final int? servings;
    final List<ServingSizeElement> servingSizes;
    final Map<String, double> nutrients;
    final String? image;

    factory Recipe.fromJson(Map<String, dynamic> json){ 
        return Recipe(
            id: json["id"],
            name: json["name"],
            tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
            description: json["description"],
            prepareTime: json["prepareTime"],
            cookTime: json["cookTime"],
            ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
            steps: json["steps"] == null ? [] : List<String>.from(json["steps"]!.map((x) => x)),
            servings: json["servings"],
            servingSizes: json["servingSizes"] == null ? [] : List<ServingSizeElement>.from(json["servingSizes"]!.map((x) => ServingSizeElement.fromJson(x))),
            nutrients: Map.from(json["nutrients"]).map((k, v) => MapEntry<String, double>(k, v)),
            image: json["image"],
        );
    }

}

class Ingredient {
    Ingredient({
        required this.name,
        required this.servingSize,
    });

    final String? name;
    final IngredientServingSize? servingSize;

    factory Ingredient.fromJson(Map<String, dynamic> json){ 
        return Ingredient(
            name: json["name"],
            servingSize: json["servingSize"] == null ? null : IngredientServingSize.fromJson(json["servingSize"]),
        );
    }

}

class IngredientServingSize {
    IngredientServingSize({
        required this.units,
        required this.desc,
        required this.qty,
        required this.grams,
        required this.scale,
    });

    final String? units;
    final String? desc;
    final double? qty;
    final double? grams;
    final double? scale;

    factory IngredientServingSize.fromJson(Map<String, dynamic> json){ 
        return IngredientServingSize(
            units: json["units"],
            desc: json["desc"],
            qty: json["qty"],
            grams: double.tryParse( json["grams"].toString()),
            scale: json["scale"],
        );
    }

}

class ServingSizeElement {
    ServingSizeElement({
        required this.scale,
        required this.qty,
        required this.grams,
        required this.units,
        required this.originalWeight,
        required this.originalWeightUnits,
    });

    final double? scale;
    final double? qty;
    final double? grams;
    final String? units;
    final double? originalWeight;
    final String? originalWeightUnits;

    factory ServingSizeElement.fromJson(Map<String, dynamic> json){ 
        return ServingSizeElement(
            scale: double.tryParse( json["scale"].toString()),
            qty: double.tryParse(["qty"].toString()),
            grams: double.tryParse(["grams"].toString()),
            units: json["units"],
            originalWeight: double.tryParse(["originalWeight"].toString()),
            originalWeightUnits: json["originalWeightUnits"],
        );
    }

}
