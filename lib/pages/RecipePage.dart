import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  RecipePage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white38,
        title: const Text('Recipe Details'),
      ),
      body: _buildUI(context),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Column(children: [_recipeImage(context), _recipeDetails()]);
  }

  Widget _recipeImage(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.40,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(recipe.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _recipeDetails() {
    return Container();
  }
}
