class RandomRecipe {
    RandomRecipe({
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
    final List<ServingSize> servingSizes;
    final Map<String, double> nutrients;
    final String? image;

    factory RandomRecipe.fromJson(Map<String, dynamic> json){ 
        return RandomRecipe(
            id: json["id"],
            name: json["name"],
            tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
            description: json["description"],
            prepareTime: json["prepareTime"],
            cookTime: json["cookTime"],
            ingredients: json["ingredients"] == null ? [] : List<Ingredient>.from(json["ingredients"]!.map((x) => Ingredient.fromJson(x))),
            steps: json["steps"] == null ? [] : List<String>.from(json["steps"]!.map((x) => x)),
            servings: json["servings"],
            servingSizes: json["servingSizes"] == null ? [] : List<ServingSize>.from(json["servingSizes"]!.map((x) => ServingSize.fromJson(x))),
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
    final ServingSize? servingSize;

    factory Ingredient.fromJson(Map<String, dynamic> json){ 
        return Ingredient(
            name: json["name"],
            servingSize: json["servingSize"] == null ? null : ServingSize.fromJson(json["servingSize"]),
        );
    }

}

class ServingSize {
    ServingSize({
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

    factory ServingSize.fromJson(Map<String, dynamic> json){ 
        return ServingSize(
            units: json["units"],
            desc: json["desc"],
            qty: json["qty"],
            grams: json["grams"],
            scale: json["scale"],
        );
    }

}
