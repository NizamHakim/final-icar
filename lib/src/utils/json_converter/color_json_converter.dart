import 'dart:ui';

Color colorFromJson(String colorString) {
  return Color(int.parse(colorString.replaceAll('#', '0xff')));
}

String colorToJson(Color color) {
  return color.toString();
}
