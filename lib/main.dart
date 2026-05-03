import 'package:flutter/material.dart';
import 'package:world_time/pages/Choose_location.dart';
import 'package:world_time/pages/Home.dart';
void main () =>runApp(MaterialApp(
  routes: {
    '/': (context) => Home(),
    '/location' : (context) => ChooseLocation()
  },
));
