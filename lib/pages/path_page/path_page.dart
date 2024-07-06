import 'package:Trip/config/constant.dart';
import 'package:Trip/pages/home_page/components/home_page_head.dart';
import 'package:Trip/pages/path_page/components/path_page_content.dart';
import 'package:Trip/pages/path_page/components/path_page_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:widget_to_marker/widget_to_marker.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/map_trip_card.dart';

class PathPage extends StatefulWidget {
  const PathPage({super.key});

  @override
  State<PathPage> createState() => _PathPageState();
}

class _PathPageState extends State<PathPage> {
  dynamic data;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      // Simulate data fetching
      await Future.delayed(Duration(seconds: 2));
      if (mounted) {
        setState(() {
          data = 'map data'; // Replace with actual data fetching logic
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = PathPageShimmer();
    if (data != null) {
      content = PathPageContent();
    }
    return Scaffold(
      body: Stack(
        children: [content],
      ),
    );
  }
}
