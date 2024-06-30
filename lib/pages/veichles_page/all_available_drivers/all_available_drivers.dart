import 'package:Trip/components/custom_app_bar.dart';
import 'package:flutter/material.dart';

class AllAvailableDriversPage extends StatefulWidget {
  const AllAvailableDriversPage({super.key});

  @override
  State<AllAvailableDriversPage> createState() =>
      _AllAvailableDriversPageState();
}

class _AllAvailableDriversPageState extends State<AllAvailableDriversPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'جميع الحائزين المتوفرين',
      ),
    );
  }
}
