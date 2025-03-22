import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/Pages/Character/character_view_model.dart';
import 'package:rickandmorty/Pages/Favorites/favorites_view_model.dart';
import 'package:rickandmorty/component/character_card_view.dart';
import 'package:rickandmorty/models/character_model.dart';

class FavoritesView extends StatefulWidget {
  const FavoritesView({super.key});

  @override
  State<FavoritesView> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends State<FavoritesView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<FavoritesViewModel>().getFavorites();
    // Sayfa her geri dönüldüğünde çalışmasını istiyorsan burada verileri yenileyebilirsin
  }

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoritesViewModel>().favorites;
    final xx = context.watch<CharacterViewModel>().charactersModel;
    List<Results> results2 = newMethod(xx);

    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return CharacterCardView(results: results2[favorites[index] - 1]);
      },
    );
  }

  List<Results> newMethod(List<CharacterModel> xx) {
    List<List<Results>?> results = xx.map((e) => e.results).toList();
    List<Results> results2 = [];
    for (var element in results) {
      for (var e in element!) {
        results2.add(e);
      }
    }
    return results2;
  }
}
