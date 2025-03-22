import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/Pages/Character/character_view.dart';
import 'package:rickandmorty/Pages/Character/character_view_model.dart';
import 'package:rickandmorty/Pages/Episodes/episodes_view.dart';
import 'package:rickandmorty/Pages/Episodes/episodes_view_model.dart';
import 'package:rickandmorty/Pages/Favorites/favorites_view.dart';
import 'package:rickandmorty/Pages/Favorites/favorites_view_model.dart';
import 'package:rickandmorty/Pages/Locations/locations_view.dart';
import 'package:rickandmorty/Pages/Locations/locations_view_model..dart';
import 'package:rickandmorty/component/app_view.dart';

class AppRoutes {
  static final characters = "/characters";
  static final favorites = "/favorites";
  static final locations = "/locations";
  static final episodes = "/episodes";
}

const Map<int, String> pageTitles = {
  0: "Characters",
  1: "Favorites",
  2: "Locations",
  3: "Episodes",
};

final router = GoRouter(
  initialLocation: AppRoutes.characters,

  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppView(
          navigationShell: navigationShell,
          pageTitle:
              pageTitles[navigationShell.currentIndex] ?? "Rick and Morty",
        );
      },
      branches: _branchesList,
    ),
  ],
);

List<StatefulShellBranch> get _branchesList {
  return [
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.characters,
          builder:
              (context, state) => ChangeNotifierProvider(
                create: (context) => CharacterViewModel(),
                child: CharacterView(),
              ),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.favorites,
          builder:
              (context, state) => MultiProvider(
                providers: [
                  ChangeNotifierProvider(
                    create: (context) => FavoritesViewModel(),
                  ),
                  ChangeNotifierProvider(
                    create: (context) => CharacterViewModel(),
                  ),
                ],
                child: FavoritesView(),
              ),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.locations,
          builder:
              (context, state) => ChangeNotifierProvider(
                create: (context) => LocationsViewModel(),
                child: LocationsView(),
              ),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          path: AppRoutes.episodes,
          builder:
              (context, state) => ChangeNotifierProvider(
                create: (context) => EpisodesViewModel(),
                child: EpisodesView(),
              ),
        ),
      ],
    ),
  ];
}
