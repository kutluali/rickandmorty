import 'package:flutter/material.dart';
import 'package:rickandmorty/models/location_model.dart';

class ResidentView extends StatelessWidget {
  final LocationModel locationModel;  
  const ResidentView({super.key, required this.locationModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(locationModel.info.pages.toString()),),
    );
  }
}