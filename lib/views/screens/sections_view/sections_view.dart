import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/sections_view/sections_view_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/decorated_container.dart';
import 'package:rickandmorty/views/widgets/episodes_list_view.dart';

class SectionsView extends StatefulWidget {
  const SectionsView({super.key});

  @override
  State<SectionsView> createState() => _SectionsViewState();
}

class _SectionsViewState extends State<SectionsView> {
@override
  void initState() {
    super.initState();
    context.read<SectionsViewModel>().getEpisodes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBarWidget(title: "Bölümler",
        transparentBackground: true),
        body: DecoratedContainer(topChild: SizedBox(height: 74),
        child: Consumer<SectionsViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.episodesModel==null) {
            return Center(
              child: CircularProgressIndicator.adaptive(),
         );
          }else{
            return Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: EpisodesListView(episodes: viewModel.episodesModel!.episodes,
              onLoadMore: viewModel.onLoadMore,
              loadMore: viewModel.loadMore,
              ),
            );
          }
        },)
        ),
      ),
    );
  }
}
