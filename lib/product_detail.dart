import 'package:flutter/cupertino.dart';

import 'card.dart';
import 'model/product.dart';
import 'personal_view.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage(this.product, {super.key});

  @override
  Widget build(BuildContext context) => CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
              "${product.seller.isMe ? "你" : product.seller.name}的“${product.title}”"),
        ),
        child: SafeArea(
          child: Column(
            // padding: EdgeInsets.all(16),
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: <Widget>[
                    Row(
                      children: [
                        PhAvatar(name: product.seller.name, size: 44),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.seller.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600)),
                            Text(
                              "${product.seller.school ?? "未知学院"} ${product.seller.successfulTrade ?? "未知"}次成交",
                              style: const TextStyle(
                                  fontSize: 14,
                                  color: CupertinoColors.systemGrey),
                            ),
                          ],
                        ),
                        const Flexible(fit: FlexFit.tight, child: SizedBox()),
                        const Icon(CupertinoIcons.chevron_forward)
                      ],
                    ),
                    const SizedBox(height: 16),
                    Image.network(product.imageUrl),
                    const SizedBox(height: 16),
                    Text(product.title,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    Column(
                      children:
                          ProductCard.makePriceTagFor(product, rtl: false),
                    ),
                    const SizedBox(height: 10),
                    Text(product.description ?? "这个人很懒 什么都没有留下",
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: CupertinoColors.quaternarySystemFill,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: product.seller.isMe
                      ? [
                          CupertinoButton(
                            child: const Text('统计'),
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            child: const Text('下架',
                                style: TextStyle(
                                    color: CupertinoColors.destructiveRed)),
                            onPressed: () {},
                          ),
                        ]
                      : [
                          CupertinoButton(
                            child: const Text('收藏'),
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            child: const Text('还价'),
                            onPressed: () {},
                          ),
                          CupertinoButton(
                            child: const Text('下单'),
                            onPressed: () {},
                          ),
                        ],
                ),
              ),
            ],
          ),
        ),
      );
}
