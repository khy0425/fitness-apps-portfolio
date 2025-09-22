import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'chad_level.dart';

class RoutePoint {
  final Position position;
  final double speed; // km/h
  final double pace; // minutes per km
  final ChadLevel chadLevel;
  final DateTime timestamp;

  RoutePoint({
    required this.position,
    required this.speed,
    required this.pace,
    required this.chadLevel,
    required this.timestamp,
  });

  Color get color => chadLevel.color;

  double get latitude => position.latitude;
  double get longitude => position.longitude;
}