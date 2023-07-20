import 'package:flutter/cupertino.dart';

import 'cupertino_tabar_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const CupertinoApp(
        title: 'Flutter Demo',
        home: CupertinoTabBarDemo(),
      );
}
