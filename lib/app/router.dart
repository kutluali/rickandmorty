import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:rickandmorty/views/screens/character_profile_view/character_profile_view.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view_model.dart';
import 'package:rickandmorty/views/screens/favourites_view/favourites_view.dart';
import 'package:rickandmorty/views/screens/favourites_view/favourites_view_model.dart';
import 'package:rickandmorty/views/screens/locations_view/location_view.dart';
import 'package:rickandmorty/views/screens/sections_view/sections_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  static String characters = "/";
  static String favourites = "/favourites";
  static String locations = "/locations";
  static String sections = "/sections";
  static String profileRoute = "characterProfile";
  static String characterProfile = "/characterProfile";
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          AppView(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.characters,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => CharactersViewModel(),
                child: CharactersView(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.profileRoute,
                  builder: (context, state) => CharacterProfileView(
                    characterModel: state.extra as CharacterModel,
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.favourites,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => FavouritesViewModel(),
                child: FavouritesView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => LocationView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => SectionsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);
