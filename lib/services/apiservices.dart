import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:recipedia/models/recipemodel.dart';

Future<Recipe> getRecipes() async{
  var endpoint = "https://dummyjson.com/recipes";
  var theUri = Uri.parse(endpoint);
  final request = await http.get(theUri);
  final recipe = recipeFromJson(request.body);
  return recipe;
}