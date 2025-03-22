import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/Pages/Character/character_view_model.dart';
import 'package:rickandmorty/component/character_card_view.dart';
import 'package:rickandmorty/models/character_model.dart';

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    context.read<CharacterViewModel>().getCharacters(1);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        final characterViewModel = Provider.of<CharacterViewModel>(
          context,
          listen: false,
        );
        characterViewModel.getCharacters(characterViewModel.x);
        characterViewModel.inc();
      }
    });
    super.initState();
  }

  @override
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final xx = context.watch<CharacterViewModel>().charactersModel;
    List<Results> results2 = newMethod(xx);
    if (xx.isEmpty) {
      return Center(child: CircularProgressIndicator());
    } else {
      return ListView.builder(
        controller: _scrollController,
        itemCount: results2.length,
        itemBuilder: (context, index) {
          return CharacterCardView(results: results2[index]);
        },
      );
    }
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
