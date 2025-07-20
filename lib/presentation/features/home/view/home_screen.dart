import 'dart:io';

import 'package:flutter/material.dart';
import 'package:session/core/app_assets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController field = TextEditingController();
  bool isValid = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // mazen
          Text('mazen'),
        ],
      ),
    );
  }
}
