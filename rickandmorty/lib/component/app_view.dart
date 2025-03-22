import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/core/theme.dart';

class AppView extends StatelessWidget {
  const AppView({
    super.key,
    required this.navigationShell,
    required this.pageTitle,
  });
  final StatefulNavigationShell navigationShell;
  final String pageTitle;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pageTitle)),

      body: navigationShell,

      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        indicatorColor: Colors.transparent,
        labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return TextStyle(color: AppTheme.color1);
          }
          return TextStyle(color: AppTheme.color3);
        }),
        destinations: _buildDestinations(),
      ),
    );
  }

  List<NavigationDestination> _buildDestinations() {
    return [
      NavigationDestination(
        icon: Icon(Icons.home, color: AppTheme.color3),
        label: "Characters",
        selectedIcon: Icon(Icons.home, color: AppTheme.color1),
      ),
      NavigationDestination(
        icon: Icon(Icons.bookmark, color: AppTheme.color3),
        label: "Favorites",
        selectedIcon: Icon(Icons.bookmark, color: AppTheme.color1),
      ),
      NavigationDestination(
        icon: Icon(Icons.location_on, color: AppTheme.color3),
        label: "Locations",
        selectedIcon: Icon(Icons.location_on, color: AppTheme.color1),
      ),
      NavigationDestination(
        icon: Icon(Icons.menu, color: AppTheme.color3),
        label: "Episodes",
        selectedIcon: Icon(Icons.menu, color: AppTheme.color1),
      ),
    ];
  }
}
