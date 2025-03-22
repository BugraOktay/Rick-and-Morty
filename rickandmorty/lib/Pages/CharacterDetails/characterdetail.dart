import 'package:flutter/material.dart';
import 'package:rickandmorty/models/character_model.dart';

class CharacterDetailView extends StatelessWidget {
  const CharacterDetailView({super.key, this.results});
  final Results? results;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(results?.image ?? 'https://via.placeholder.com/150'),
        Text(results?.name ?? 'Unknown'),
        Text(results?.status ?? 'Unknown'),
        Text(results?.species ?? 'Unknown'),
      ],
    );
  }
}
