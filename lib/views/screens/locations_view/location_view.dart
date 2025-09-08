import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/locations_view/location_list_view.dart';
import 'package:rickandmorty/views/screens/locations_view/location_view_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/decorated_container.dart';

class LocationView extends StatefulWidget {
  const LocationView({super.key});

  @override
  State<LocationView> createState() => _LocationViewState();

}

class _LocationViewState extends State<LocationView> {
 @override
  void initState() {
    super.initState();
    context.read<LocationViewModel>().getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBarWidget(title: "Konumlar", transparentBackground: true,),
        body: DecoratedContainer(
          child:_locationListView(),
          topChild: SizedBox(height: 74,),
        ),
      ),
    );
  }

  Widget _locationListView(){
    return Consumer<LocationViewModel>(builder: (context, viewModel, child){
      if (viewModel.locationModel==null) {
        return Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }else{
        return Padding(
          padding: const EdgeInsets.only(top:30.0),
          child: LocationListView(
            locationModel: viewModel.locationModel!, 
            loadMore: viewModel.loadMore, 
            onLoadMore: viewModel.getMoreLocations,),
        );
      }

    });
  }
}
 