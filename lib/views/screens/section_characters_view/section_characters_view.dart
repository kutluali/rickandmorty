import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/episode_model.dart';
import 'package:rickandmorty/views/screens/section_characters_view/section_characters_view_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/character_card_listview.dart';

class SectionCharactersView extends StatefulWidget {
  final EpisodeModel episodeModel;  
  const SectionCharactersView({super.key, required this.episodeModel});

  @override
  State<SectionCharactersView> createState() => _SectionCharactersViewState();
}

class _SectionCharactersViewState extends State<SectionCharactersView> {
  @override
  void initState() {
   context.read<SectionCharactersViewModel>()
        .getCharacters(widget.episodeModel);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.episodeModel.episode),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Consumer<SectionCharactersViewModel>(builder: (context, viewModel, child){
            return CharacterCardListView(characters: viewModel.characters);
          },  
          ),
        ],
      ),
      )
    );
  }
}