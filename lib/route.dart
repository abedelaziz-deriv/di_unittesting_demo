import 'package:flutter/material.dart';

import 'features/articles/articles_screen.dart';
import 'features/landing_screen/landing_screen.dart';

const String landingScreen = 'landing_screen';
const String articlesScreen = 'articles_screen';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case landingScreen:
      return MaterialPageRoute<LandingScreen>(
          builder: (BuildContext context) => const LandingScreen());
    case articlesScreen:
      return MaterialPageRoute<ArticlesScreen>(
          settings: settings,
          builder: (BuildContext context) => const ArticlesScreen());

    default:
      throw Exception('This route name does not exit');
  }
}
