import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/favourites_view/favourites_view_model.dart';
import 'package:rickandmorty/views/widgets/character_card_listview.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  @override
  void initState() {
    super.initState();
    context.read<FavouritesViewModel>().getFavourites();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavouritesViewModel>();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: viewModel.characters.isEmpty
              ? CircularProgressIndicator.adaptive()
              : Column(
                  children: [
                    CharacterCardListView(characters: viewModel.characters),
                  ],
                ),
        ),
      ),
    );
  }
}
