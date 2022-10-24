import 'package:game_center/main.import.dart';

abstract class DarkTheme {
  DarkTheme._();
  static MaterialColor tiger = MaterialColor(
    const Color(0xff4a7ce3).value,
    const <int, Color>{
      100: Color.fromARGB(255, 220, 232, 255),
      200: Color.fromARGB(255, 187, 210, 255),
      300: Color.fromARGB(255, 131, 161, 220),
      400: Color.fromARGB(255, 102, 142, 221),
      500: Color(0xff4a7ce3),
      600: Color(0xff4a7ce3),
      700: Color.fromARGB(255, 39, 96, 209),
      900: Color.fromARGB(255, 13, 69, 180)
    },
  );
  static const Color doffWhite = Color.fromARGB(255, 255, 255, 255);
  static const Color neutralBlack = Color(0xff1c1f2a);
  static const Color textGrey = Color(0xFF747172);
  static const Color ashGrey = Color(0xFF8E8B8C);
  static const Color borderShade = Color(0xFFDEDEDE);
  static const Color raspberry = Color(0xFFE20055);
  static const Color sunglow = Color(0xFFFFD23F);
  static const Color tango = Color(0xFF6FCACF);
  static const Color torque = Color(0xFF25A8A0);
  static const List<Color> tigerBerry = [Color(0xff4a7ce3), Color(0xFFE20055)];
}
