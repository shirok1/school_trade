import 'package:flutter/cupertino.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'card.dart';
import 'chat_page.dart';
import 'model/product.dart';
import 'model/trade_type.dart';
import 'model/user.dart';
import 'order_status_page.dart';
import 'personal_view.dart';

enum MessageType {
  order,
  chat;
}

class MyNoti {
  final MessageType type;

  final String subtitle;
  final String? status;
  final TradeType? pt;

  final Product? product;
  final User user;

  const MyNoti({
    required this.type,
    required this.user,
    required this.subtitle,
    this.status,
    this.pt,
    this.product,
  });
}

class MessageListPage extends StatefulWidget {
  const MessageListPage({super.key});

  @override
  State<MessageListPage> createState() => _MessageListPageState();
}

class _MessageListPageState extends State<MessageListPage> {
  static const List<MyNoti> messages = [
    MyNoti(
        type: MessageType.order,
        subtitle: '已送达指定地点',
        status: '完成',
        pt: TradeType.free,
        product: Product(
          title: "联名双肩包",
          imageUrl: 'https://source.unsplash.com/256x256/?backpack',
          seller: User(name: "王司徒"),
        ),
        user: User(name: "王司徒")),
    MyNoti(
        type: MessageType.chat,
        subtitle: '你信他还是信我是秦始皇',
        user: User(name: "秦始皇")),
    // Add more messages...
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text('消息'),
        ),
        child: SafeArea(
          child: CupertinoListSection(
              header: const Text('消息列表'),
              children: messages
                  .map((message) => CupertinoListTile(
                        leading: message.type == MessageType.order
                            ? (message.pt != null
                                ? ProductCard.makeBadge(message.pt!,
                                    child: Image.network(
                                        message.product!.imageUrl))
                                : Image.network(message.product!.imageUrl))
                            : PhAvatar(name: message.user.name),
                        title: Row(
                          children: [
                            Text(message.type == MessageType.order
                                ? "${message.user.name}的“${message.product!.title}”"
                                : message.user.name),
                          ],
                        ),
                        subtitle: Text(message.subtitle),
                        trailing: const Icon(CupertinoIcons.chevron_forward),
                        onTap: () {
                          switch (message.type) {
                            case MessageType.order:
                              Navigator.push(
                                context,
                                SwipeablePageRoute(
                                  builder: (context) =>
                                      OrderStatusPage(message: message),
                                ),
                              );
                              break;
                            case MessageType.chat:
                              Navigator.push(
                                context,
                                SwipeablePageRoute(
                                  builder: (context) =>
                                      ChatPage(message: message),
                                ),
                              );
                              break;
                          }
                        },
                      ))
                  .toList()),
        ));
  }
}
