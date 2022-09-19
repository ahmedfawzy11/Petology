import 'package:flutter/material.dart';
import 'package:petology_web/Screens/homeScreen.dart';
import 'package:petology_web/Shared/Network/dioHelper.dart';

void main() {
  DioHelper.init();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
