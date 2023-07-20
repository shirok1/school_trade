import 'package:flutter/cupertino.dart';

import 'message_list.dart';

class OrderStatusPage extends StatelessWidget {
  final MyNoti message;

  const OrderStatusPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("${message.user.name}的“${message.product!.title}”"),
        trailing: CupertinoButton(
          padding: const EdgeInsets.all(0),
          child: const Text('更多'),
          onPressed: () {},
        ),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(message.product!.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text('订单名称: ${message.product!.title}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            Text('订单详情: ${message.subtitle}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text('订单状态: ${message.status}',
                style: TextStyle(
                    fontSize: 16, color: CupertinoColors.systemGreen)),
          ],
        ),
      ),
    );
  }
}
