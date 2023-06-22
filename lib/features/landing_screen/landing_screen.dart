import 'package:di_unittesting_demo/core/enums.dart';
import 'package:di_unittesting_demo/keys/landing/landing_screen_keys.dart';
import 'package:flutter/material.dart';
import 'package:di_unittesting_demo/route.dart' as route;

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        key: landingScreenKey,
        appBar: AppBar(
          title: const Text('Demo App'),
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  key: landingScreenMostEmailedButtonKey,
                  onPressed: () => navigate(context, ContentType.mostEmailed),
                  child: const Text('Most Emailed Articles')),
              ElevatedButton(
                  key: landingScreenMostViewedButtonKey,
                  onPressed: () => navigate(context, ContentType.mostViewed),
                  child: const Text('Most Viewed Articles')),
              ElevatedButton(
                  key: landingScreenMostSharedButtonKey,
                  onPressed: () => navigate(context, ContentType.mostShared),
                  child: const Text('Most Shared Articles')),
            ],
          ),
        ),
      );

  void navigate(BuildContext context, ContentType type) {
    Navigator.pushNamed(context, route.articlesScreen, arguments: type);
  }
}
