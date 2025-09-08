import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/views/screens/residents_view/resident_view_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/character_card_listview.dart';

class ResidentView extends StatefulWidget {
  final LocationItem locationItem;  
  const ResidentView({super.key, required this.locationItem});

  @override
  State<ResidentView> createState() => _ResidentViewState();
}

class _ResidentViewState extends State<ResidentView> {
  @override
  void initState() {
   context.read<ResidentViewModel>()
   .getResidents(widget.locationItem.residents);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.locationItem.name),
      body: Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Consumer<ResidentViewModel>(builder: (context, viewModel, child){
            return CharacterCardListView(characters: viewModel.residents);
          },  
          ),
        ],
      ),
      )
    );
  }
}