import 'package:recipes_app/models/Recipe.dart';
import 'package:recipes_app/services/http_service.dart';

class DataService {
  static final DataService _singleton = DataService._internal();

  final HTTPService _httpService = HTTPService();

  factory DataService() {
    return _singleton;
  }

  DataService._internal();

  Future<List<Recipe>?> getRecipes(String filter) async {
    try {
      String path = "recipes/";

      if (filter.isNotEmpty) {
        path += "meal-type/$filter";
      }

      var response = await _httpService.get(path);

      if (response != null &&
          response.statusCode == 200 &&
          response.data != null) {
        List recipesData;

        if (response.data is Map && response.data['recipes'] != null) {
          // API returns: { "recipes": [...], "total": 50, "skip": 0, "limit": 30 }
          recipesData = response.data['recipes'];
        } else if (response.data is List) {
          // Direct array response
          recipesData = response.data;
        } else {
          print("Unexpected response format: ${response.data.runtimeType}");
          return [];
        }

        List<Recipe> recipes = recipesData
            .map((recipe) => Recipe.fromJson(recipe))
            .toList();

        print("Loaded ${recipes.length} recipes");
        return recipes;
      }

      print("Failed to load recipes: ${response?.statusCode}");
      return []; // Return empty list instead of null
    } catch (error) {
      print("Error in getRecipes: $error");
      return []; // Return empty list on error
    }
  }
}
