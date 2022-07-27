import 'package:flutter/material.dart';
import 'package:petology_web/Screens/home_screen.dart';
import 'package:petology_web/Shared/Network/dio_helper.dart';

void main() {
  DioHelper.init();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
