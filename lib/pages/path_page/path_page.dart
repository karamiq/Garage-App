import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
import 'package:Trip/pages/path_page/components/path_page_content.dart';
import 'package:Trip/pages/path_page/components/path_page_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import 'components/map_trip_card.dart';

class PathPage extends StatefulWidget {
  const PathPage({super.key});

  @override
  State<PathPage> createState() => _PathPageState();
}

class _PathPageState extends State<PathPage> {
  late GoogleMapController mapController;
  List<LatLng> polylineCoordinates = [];
  Map<String, Marker> markers = {};
  final LatLng _startPoint =
      LatLng(33.32805, 44.301488); // Example: Start Point
  final LatLng _endPoint = LatLng(33.412805, 44.381488); // Example: End Point

  String themeForMap = '';

  @override
  void initState() {
    super.initState();
    getPolyPoints();
    DefaultAssetBundle.of(context)
        .loadString(Assets.assetsThemesDarkMapStyle)
        .then((value) {
      themeForMap = value;
    });
    addMarker('1', _endPoint, Assets.assetsIconsLocationTick, context);
    addMarker('2', _startPoint, Assets.assetsIconsMapPin, context);
  }

  Future<void> getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey:
          'AIzaSyC_HxdEWLvZODhPgCUxKtzXEBu6UCIanEU', // Replace with your API key
      request: PolylineRequest(
        origin: PointLatLng(_startPoint.latitude, _startPoint.longitude),
        destination: PointLatLng(_endPoint.latitude, _endPoint.longitude),
        mode: TravelMode.driving,
      ),
    );
    print(result);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
    }
    setState(() {});
  }

  Future<void> addMarker(
      String id, LatLng location, String icon, BuildContext context) async {
    final marker = Marker(
      markerId: MarkerId(id),
      position: location,
      icon: await Container(
        child: SvgPicture.asset(
          icon,
          color: const Color.fromARGB(255, 79, 180, 131),
          height: 30,
        ),
      ).toBitmapDescriptor(logicalSize: const Size(430, 430)),
    );
    setState(() {
      markers[id] = marker;
    });
  }

  @override
  Widget build(BuildContext context) {
    //i can do all the data fetch here and then pass it to the
    //PathPageContent to display it to the user
    Widget content = PathPageShimmer();
    dynamic data = 'map data';
    if (data != null) {
      content = PathPageContent();
    } else {
      content = PathPageShimmer();
    }
    return Scaffold(
      body: Stack(
        children: [content],
      ),
    );
  }
}
