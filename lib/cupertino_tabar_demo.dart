import 'package:flutter/cupertino.dart';

import 'maze_view.dart';
import 'message_list.dart';
import 'personal_view.dart';
import 'post.dart';

class CupertinoTabBarDemo extends StatefulWidget {
  const CupertinoTabBarDemo({super.key});

  @override
  State<CupertinoTabBarDemo> createState() => _CupertinoTabBarDemoState();
}

class _CupertinoTabBarDemoState extends State<CupertinoTabBarDemo> {
  @override
  Widget build(BuildContext context) => CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: '广场'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_yen_circle), label: '发布'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.conversation_bubble), label: ('消息')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled), label: ('我的')),
        ],
      ),
      tabBuilder: (BuildContext context, int index) => CupertinoTabView(
          builder: (BuildContext context) {
            return [
              const MazeView(),
              const PostPage(),
              const MessageListPage(),
              const PersonalView(),
            ][index];
          },
        ),
    );
}
