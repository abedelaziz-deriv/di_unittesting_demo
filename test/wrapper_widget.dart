import 'package:di_unittesting_demo/route.dart';
import 'package:flutter/material.dart';

import 'mocks/mock_navigator_observer.dart';

class WrapperWidget extends StatelessWidget {
  const WrapperWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) => MaterialApp(
      onGenerateRoute: controller,
      navigatorObservers: [MockNavigatorObserver()],
      home: child);
}
