import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
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

  //TODO: Billing account must be enabled for the usage of routes
  //it might works just telleing me that:
  /*
  ERROR:flutter/runtime/dart_vm_initializer.cc(41)] Unhandled Exception: Exception: Unable to get route: Response ---> REQUEST_DENIED 
#0      NetworkUtil.getRouteBetweenCoordinates (package:flutter_polyline_points/src/network_util.dart:59:9)
<asynchronous suspension>
#1      PolylinePoints.getRouteBetweenCoordinates (package:flutter_polyline_points/flutter_polyline_points.dart:30:20)
<asynchronous suspension>
#2      _PathPageState.getPolyPoints (package:Trip/pages/path_page/path_page.dart:45:29)
*/
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
    final from = 'كراج العلاوي ';
    final to = 'كراج ام قصر';
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
                target: LatLng(33.312805, 44.361488), zoom: 10.5),
            onMapCreated: (controller) {
              mapController = controller;
              mapController.setMapStyle(themeForMap);
            },
            markers: markers.values.toSet(),
            polylines: {
              Polyline(
                  width: 5,
                  color: Colors.green,
                  polylineId: PolylineId('line'),
                  points: polylineCoordinates)
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.medium),
              child: HomePageHead(
                imageUrl: Assets.assetsImagesAvatarImage,
              ),
            ),
          ),
          MapTripCard(from: from, to: to)
        ],
      ),
    );
  }
}
