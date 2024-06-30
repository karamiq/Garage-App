import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
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
          GoogleMap(
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition:
                CameraPosition(target: LatLng(33.312805, 44.361488), zoom: 10),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.medium),
              child: HomePageHead(
                imageUrl: Assets.assetsImagesAvatarImage,
              ),
            ),
          )
        ],
      ),
    );
  }
}
