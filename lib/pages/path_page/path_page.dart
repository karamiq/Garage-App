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

  @override
  Widget build(BuildContext context) {
    Widget content = PathPageShimmer();
    dynamic data = 'map data'; // Replace with actual data fetching logic
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
