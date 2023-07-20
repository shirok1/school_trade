import 'package:flutter/cupertino.dart';

import 'message_list.dart';

class ChatPage extends StatefulWidget {
  final MyNoti message;

  const ChatPage({super.key, required this.message});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.message.user.name),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: const Text('详情'),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    alignment: index % 2 == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemFill,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text('消息 $index'),
                    ),
                  );
                },
              ),
            ),
            CupertinoTextField(
              controller: textController,
              placeholder: '输入消息',
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: const BoxDecoration(
                border:
                    Border(top: BorderSide(color: CupertinoColors.separator)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
