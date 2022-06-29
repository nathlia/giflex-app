import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'My Smart App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
                  brightness: Brightness.dark,
                  primarySwatch: Palette.myColor,
                  backgroundColor: Palette.myColor[400])
              .copyWith(
            primary: Palette.myColor[50],
            secondary: Palette.myColor[100],
          ),
          textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        ),
        routeInformationParser: Modular.routeInformationParser,
        routerDelegate: Modular.routerDelegate);
  }
}

class Palette {
  static const MaterialColor myColor = MaterialColor(
    0xFF45396b,
    <int, Color>{
      50: Color(0xFF9d75f2),
      100: Color(0xFF45396b),
      200: Color(0xFF28263b),
      300: Color(0xFF191923),
      400: Color(0xFF121212),
      500: Color(0xFFa2a1a9),
      600: Color(0xFFc69723),
      700: Color(0xFF28263b),
    },
  );
}
