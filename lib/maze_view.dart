import 'package:flutter/cupertino.dart';

import 'model/product.dart';
import 'model/trade_type.dart';
import 'model/user.dart';
import 'product_column.dart';

class MazeView extends StatelessWidget {
  const MazeView({super.key});

  static const demoData = [
    Product(
      title: "自用苹果手机 16",
      description: '''
苹果手机 16 国行 128G 二手手机
【验货总结】
屏幕划痕细微，外壳划痕细微，磕碰掉漆细微，电池更换/维修。详情请看上方验货报告。
本机功能及拆修情况经过专业检测工具检测，详情见报告。机器外观成色如图
【关于版本】国行全网通，双卡双待
【关于电池】换电池，效率100
【内存】128g
【关于配件】赠送全新充电线，手机壳
【发货时间】付款后24小时内发货
【关于运费】店家包邮发出
【关于售后】保修30天，支持7天质量问题退货换货
（温馨提示：每部机器机身底部表面都贴有防止拆机的防拆标签，签收后请勿私自撕毁手机底部防拆标签，撕毁将无法享受售后服务）''',
      imageUrl: 'https://source.unsplash.com/512x512/?iphone',
      purchasePrice: "¥1000",
      seller: User(name: '诸葛亮', school: "深职院", successfulTrade: 1490),
    ),
    Product(
      title: '作业代写',
      description: '代写计算机作业，包括 C 语言、数据结构等。',
      imageUrl: 'https://source.unsplash.com/512x512/?homework',
      rentPrice: "¥100/次",
      seller: User(name: '刘备', school: "计算机学院", successfulTrade: 100),
    ),
    Product(
      title: 'JavaScript 高级编程指南',
      description: "这本书质量还不错，推荐想转前端方向的同学",
      imageUrl: 'https://source.unsplash.com/512x512/?javascript',
      purchasePrice: "¥40",
      seller: User(name: '张飞', school: "机电学院", successfulTrade: 10),
    ),
    Product(
      title: '黑色高级折叠伞',
      description: "给我学狗叫，三回啊三回",
      imageUrl: 'https://source.unsplash.com/512x512/?umbrella',
      isFree: true,
      seller: User(name: '关羽', school: "山口组", successfulTrade: 1),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('广场')),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const CupertinoSearchTextField(placeholder: '搜索'),
            const SizedBox(height: 16),
            CupertinoSlidingSegmentedControl<TradeType>(
              children: tradeTypesText,
              onValueChanged: (v) => {},
              groupValue: TradeType.sell,
            ),
            const SizedBox(height: 16),
            const ProductColumn(data: demoData),
          ],
        ),
      ),
    );
  }
}
