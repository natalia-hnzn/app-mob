import 'package:flutter/material.dart';
import 'package:app_store/pages/catalog.dart';
import 'package:app_store/pages/login.dart';

void main() {
  runApp(
    MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.lime,
        ),
        debugShowCheckedModeBanner: false,
        home: Login()),
  );
}
