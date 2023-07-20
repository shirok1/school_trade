import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boring_avatars/flutter_boring_avatars.dart';

import 'model/pallet.dart';
import 'model/product.dart';
import 'model/user.dart';
import 'product_column.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  static const myName = "张三";
  static const me = User(name: myName, school: "理学院", successfulTrade: 3);

  static const demoData = [
    Product(
      title: '镜子',
      imageUrl: 'https://source.unsplash.com/512x512/?mirror',
      isFree: true,
      seller: me,
    ),
    Product(
      title: '游戏卡带',
      imageUrl: 'https://source.unsplash.com/512x512/?game,cartridge',
      purchasePrice: "¥200",
      rentPrice: "¥20/天",
      seller: me,
    ),
    Product(
      title: 'U盘',
      imageUrl: 'https://source.unsplash.com/512x512/?flash+disk',
      purchasePrice: "¥50",
      seller: me,
    )
  ];

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: const Text('我的'),
          trailing: CupertinoButton(
            padding: const EdgeInsets.all(0),
            child: const Icon(CupertinoIcons.settings),
            onPressed: () {},
          ),
        ),
        child: SafeArea(
          child: ListView(padding: const EdgeInsets.all(16.0), children: [
            Column(children: [
              PhAvatar(name: myName, size: 64),
              SizedBox(height: 8),
              Text(myName, style: TextStyle(fontSize: 22)),
              SizedBox(height: 8),
              Text('认证信息: ${me.school ?? "未知学院"}',
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('成交次数: ${me.successfulTrade ?? "未知"}',
                  style: TextStyle(fontSize: 16))

            ]),
            SizedBox(height: 8),
            Divider(),
            SizedBox(height: 8),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('已发布的商品', style: TextStyle(fontSize: 22)),
              SizedBox(height: 16),
              ProductColumn(data: demoData)
            ])
          ]),
        ),
      );
}

class PhAvatar extends StatelessWidget {
  const PhAvatar({
    super.key,
    required this.name,
    this.size,
  });

  final String name;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        child: BoringAvatars(
            name: name, colors: boringColor, type: BoringAvatarsType.beam));
  }
}
