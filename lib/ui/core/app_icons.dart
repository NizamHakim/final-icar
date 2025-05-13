import 'package:flutter/material.dart';

class AppIcons {
  static const IconData home = Icons.home;
  static const IconData homeOutlined = Icons.home_outlined;
  static const IconData list = Icons.list;
  static const IconData listOutlined = Icons.list_outlined;
  static const IconData profile = Icons.person;
  static const IconData profileOutlined = Icons.person_outline;
  static const IconData busStops = Icons.directions_bus;
  static const IconData route = Icons.route_outlined;
  static const IconData arrowRight = Icons.keyboard_arrow_right_sharp;
  static const IconData icar = Icons.directions_car_outlined;
  static const IconData world = Icons.language;
  static const IconData chat = Icons.chat_bubble_outline;
  static const IconData logout = Icons.logout;
  static const IconData eye = Icons.visibility_outlined;
  static const IconData eyeSlashed = Icons.visibility_off_outlined;
}

enum AppIconsSvg {
  busStop("assets/icons/bus-stop.svg"),
  route("assets/icons/route.svg"),
  home("assets/icons/home.svg"),
  homeOutline("assets/icons/home_outline.svg"),
  list("assets/icons/list.svg"),
  car("assets/icons/car.svg"),
  person("assets/icons/person.svg"),
  personOutline("assets/icons/person_outline.svg"),
  search("assets/icons/search.svg"),
  walk("assets/icons/walk.svg"),
  clock("assets/icons/clock.svg"),
  calendar("assets/icons/calendar.svg"),
  carLeft("assets/icons/car_left.svg"),
  carRight("assets/icons/car_right.svg"),
  checkCircle("assets/icons/check_circle.svg"),
  chevronRight("assets/icons/chevron_right.svg");

  const AppIconsSvg(this.path);

  final String path;
}
