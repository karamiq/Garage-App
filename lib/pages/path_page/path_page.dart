import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PathPage extends StatelessWidget {
  const PathPage({super.key});

  @override
  Widget build(BuildContext context) {
    final camPos = CameraPosition(target: LatLng(33.312805, 44.361488));
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: ListTile(),
          ),
          GoogleMap(initialCameraPosition: camPos)
        ],
      ),
    );
  }
}