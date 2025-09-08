import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/models/episode_model.dart';
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
import 'package:rickandmorty/views/screens/section_characters_view/section_characters_view.dart';
import 'package:rickandmorty/views/screens/section_characters_view/section_characters_view_model.dart';
import 'package:rickandmorty/views/screens/sections_view/sections_view.dart';
import 'package:rickandmorty/views/screens/sections_view/sections_view_model.dart';
import 'package:rickandmorty/views/screens/settings_view/settings_view.dart';
import 'package:rickandmorty/views/screens/settings_view/settings_view_model.dart';

final _routerKey = GlobalKey<NavigatorState>();
final _shellNavigatorCharactersKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellCharacters');
final _shellNavigatorFavouritesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellFavourites');
final _shellNavigatorLocationsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellLocations');
final _shellNavigatorSectionsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSections');

class AppRoutes {
  AppRoutes._();

  static const String characters = '/';
  static const String favourites = '/favourites';
  static const String locations = '/locations';
  static const String sections = '/sections';
  static const String settings = '/settings';

  static const String profileRoute = 'characterProfile';
  static const String characterProfile = '/characterProfile';

  static const String residentsRoute = 'residents';
  static const String residents = '/locations/residents';

  static const String sectionCharactersRoute = 'characters';
  static const String sectionCharacters = '/sections/characters';
}

final router = GoRouter(
  navigatorKey: _routerKey,
  initialLocation: AppRoutes.characters,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppView(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCharactersKey,
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
          navigatorKey: _shellNavigatorFavouritesKey,
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
          navigatorKey: _shellNavigatorLocationsKey,
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
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => ResidentViewModel(),
                    child: ResidentView(
                      locationItem: state.extra as LocationItem,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSectionsKey,
          routes: [
            GoRoute(
              path: AppRoutes.sections,
              builder: (context, state) => ChangeNotifierProvider(
                create: (context) => SectionsViewModel(),
                child: const SectionsView(),
              ),
              routes: [
                GoRoute(
                  path: AppRoutes.sectionCharactersRoute,
                  builder: (context, state) => ChangeNotifierProvider(
                    create: (context) => SectionCharactersViewModel(),
                    child: SectionCharactersView(
                      episodeModel: state.extra as EpisodeModel,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  GoRoute(
      path: AppRoutes.settings,
      builder: (context, state) => ChangeNotifierProvider(
        create: (context) => SettingsViewModel(),
        child: const SettingsView(),
      ),
    ),
  ],
);