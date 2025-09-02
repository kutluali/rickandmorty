import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/views/app_view.dart';
import 'package:rickandmorty/views/screens/character_profile_view/character_profile_view.dart';
import 'package:rickandmorty/views/screens/character_profile_view/character_profile_view_model.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view_model.dart';
import 'package:rickandmorty/views/screens/favourites_view/favourites_view.dart';
import 'package:rickandmorty/views/screens/favourites_view/favourites_view_model.dart';
import 'package:rickandmorty/views/screens/locations_view/location_view.dart';
import 'package:rickandmorty/views/screens/locations_view/location_view_model.dart';
import 'package:rickandmorty/views/screens/residents_view/resident_view.dart';
import 'package:rickandmorty/views/screens/residents_view/resident_view_model.dart';
import 'package:rickandmorty/views/screens/sections_view/sections_view.dart';

final _routerKey = GlobalKey<NavigatorState>();

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favourites = '/favourites';
  static const String locations = '/locations';
  static const String sections = '/sections';

  static const String profileRoute = 'characterProfile';
  static const String characterProfile = '/characterProfile';

static const String residentsRoute = 'resident';
  static const String residents = '/locations/resident';
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
                child: const CharactersView(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.profileRoute,
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => CharacterProfileViewModel(),
                    child: CharacterProfileView(
                      characterModel: state.extra as CharacterModel,
                    ),
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
                child: const FavouritesView(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.locations,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => LocationViewModel(),
                child: const LocationView(),
              ),
               routes: [
                GoRoute(
                  path: AppRoutes.residentsRoute,
                  builder: (context, state) => ResidentView(locationModel: state.extra as LocationModel)
                  ),
              
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => const SectionsView(),
            ),
          ],
        ),
      ],
    ),
  ],
);