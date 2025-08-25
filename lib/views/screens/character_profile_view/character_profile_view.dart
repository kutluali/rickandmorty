import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';

class CharacterProfileView extends StatelessWidget {
  final CharacterModel characterModel;
  const CharacterProfileView({super.key, required this.characterModel});

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
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 13.0, top: 15),
                      child: Text(
                        characterModel.name,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
            backgroundImage: NetworkImage(characterModel.image),
          ),
        ),
      ),
    );
  }
}
