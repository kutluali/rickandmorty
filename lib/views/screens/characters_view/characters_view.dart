import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/characters_view/characters_view_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/character_card_listview.dart';


class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactersViewModel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharactersViewModel>();
    return Scaffold(
      appBar: AppBarWidget(title: 'Rick and Morty'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              _searchInputWidget(context, viewModel: viewModel),
              viewModel.charactersModel == null
                  ? const CircularProgressIndicator.adaptive()
                  : CharacterCardListView(
                      characters: viewModel.charactersModel!.characters,
                      onLoadMore: () => viewModel.getCharactersMore(),
                      loadMore: viewModel.loadMore,
                    ),
            ],
          ),
        ),
      ),
    );
  }
// Arama Çubuğu

  Widget _searchInputWidget(
    BuildContext context, {
    required CharactersViewModel viewModel,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextFormField(
        textInputAction: TextInputAction
            .search, // Klavyedeki Enter Butonunu  Arama butonu yaptık
        onFieldSubmitted: viewModel.getCharactersByName,
        decoration: InputDecoration(
          labelText: "Karakterlerde Ara",
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search), //Sola Ikon
          suffixIcon: PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: viewModel.onCharacterTypeChanged,
            itemBuilder: (context) {
              return CharacterType.values
                  .map((e) => PopupMenuItem(value: e, child: Text(e.name)))
                  .toList();
            },
          ),
        ),
      ),
    );
  }
}
