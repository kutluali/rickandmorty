import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/views/screens/character_profile_view/character_profile_view_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';

class CharacterProfileView extends StatefulWidget {
  final CharacterModel characterModel;
  const CharacterProfileView({super.key, required this.characterModel});

  @override
  State<CharacterProfileView> createState() => _CharacterProfileViewState();
}

class _CharacterProfileViewState extends State<CharacterProfileView> {
  @override
  void initState() {
    super.initState();
    //context
    //.read<CharacterProfileView
  }

  @override
  Widget build(BuildContext context) {
    //SafeArea ile Arka plan resmini saat ve bildirim satırından bir alt satıra alrak üst kısmı kaplamasını engelledik
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar:
            true, //AppBar kısmına kadar Arka plan resmini doldurur.
        appBar: AppBarWidget(title: "Karakter", transparentBackground: true),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg-image.png"),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _characterAvatar(context),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      _characterName(),
                      _labelView(context),
                      SizedBox(height: 38),
                      _scenesTitle(),
                      SizedBox(height: 15),
                      Flexible(child: Consumer<CharacterProfileViewModel>(builder: (context, viewModel, child) {
                        return Episo
                      },)
                      
                      
                      )

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _characterName() {
    return Padding(
                      padding: const EdgeInsets.only(bottom: 13.0, top: 15),
                      child: Text(
                        widget.characterModel.name,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    );
  }

  Container _scenesTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 18),
      child: Text(
        "Bölümler (${widget.characterModel.episode.length})",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    );
  }

  Padding _labelView(BuildContext context) {
    //Wrap Widget Bütün labelları yan yana ekler. Eğer taşma olursa alt satıra yerleştirir
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 39.0),
      child: Wrap(
        runSpacing: 14,
        spacing: 7,
        alignment: WrapAlignment.center,
        children: [
          _labelWidget(context, label: widget.characterModel.status),
          _labelWidget(context, label: widget.characterModel.origin.name),
          _labelWidget(context, label: widget.characterModel.gender),
          _labelWidget(context, label: widget.characterModel.species),
        ],
      ),
    );
  }

  //Süslü parantez parametreli çağırmayı
  Container _labelWidget(BuildContext context, {required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text("Örnek Metin", style: TextStyle(fontSize: 12)),
    );
  }

  Padding _characterAvatar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 90, bottom: 52),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        radius: 100,
        child: CircleAvatar(
          radius: 98,
          backgroundColor: Theme.of(context).colorScheme.surface,
          child: CircleAvatar(
            radius: 95,
            backgroundImage: NetworkImage(widget.characterModel.image),
          ),
        ),
      ),
    );
  }
}
