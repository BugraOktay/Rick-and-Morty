import 'package:flutter/material.dart';
import 'package:rickandmorty/Pages/CharacterDetails/characterdetail.dart';
import 'package:rickandmorty/core/shared_preferance.dart';
import 'package:rickandmorty/core/theme.dart';
import 'package:rickandmorty/models/character_model.dart';

class CharacterCardView extends StatefulWidget {
  const CharacterCardView({super.key, this.results});
  final Results? results;
  @override
  State<CharacterCardView> createState() => _CharacterCardViewState();
}

class _CharacterCardViewState extends State<CharacterCardView> {
  Color _iconColor = AppTheme.color1;
  bool _isFavorite = false;

  void _toggleFavorites() {
    setState(() {
      _isFavorite = !_isFavorite;
      _iconColor = _isFavorite ? AppTheme.color4 : AppTheme.color1;
    });

    SharedPreferenceHelper prefHelper = SharedPreferenceHelper();
    prefHelper.toggleFavorite(widget.results!.id ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder:
                  (context) => CharacterDetailView(results: widget.results),
            ),
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        child: SizedBox(
          height: 100,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Card(
                elevation: 8,
                color: AppTheme.color2,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        widget.results?.image ??
                            'https://via.placeholder.com/150',
                      ),
                    ),
                    _infoColumn(),
                  ],
                ),
              ),
              IconButton(
                onPressed: _toggleFavorites,
                icon: Icon(Icons.bookmark_border, color: _iconColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _infoColumn() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${widget.results?.id.toString()}) ${widget.results?.name}"),
          Text(widget.results?.status ?? 'Unknown'),
          Text(widget.results?.gender ?? 'Unknown'),
        ],
      ),
    );
  }
}
