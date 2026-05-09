import 'package:flutter/material.dart';
import 'package:recipes_app/models/Recipe.dart';

class RecipePage extends StatelessWidget {
  final Recipe recipe;

  RecipePage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,
        title: const Text('Recipe Details'),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return Column(children: []);
  }
}
