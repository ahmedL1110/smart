import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../layout/Cubit/CubitBloc.dart';
import '../../layout/Cubit/StateBloc.dart';

class MyMap extends StatelessWidget {

  late GoogleMapController _googleMapController;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.42796133580664, 34.4),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          body: GoogleMap(
            initialCameraPosition: _kGooglePlex,
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            onMapCreated: (GoogleMapController googleMapController) {
              _googleMapController = googleMapController;
            },
            markers: LayoutCubit.get(context).markers,
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () async {
              Position position = await _determinePosition();

              _googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                      target: LatLng(position.latitude, position.longitude),
                      zoom: 17.0),
                ),
              );
              LayoutCubit.get(context).markers.clear();
              LayoutCubit.get(context).MyLocation(latitude: position.latitude, longitude: position.longitude);

            },
            label: Text('To the lake!'),
            icon: Icon(Icons.directions_boat),
          ),
        );
      },listener: (context, state) {},);
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location Service are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission disabled');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location Permission are permanently disabled');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }
}
