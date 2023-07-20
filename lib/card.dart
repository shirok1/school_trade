import 'dart:ui';

import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/product.dart';
import 'model/trade_type.dart';
import 'personal_view.dart';

class ProductCard extends StatelessWidget {
  final bool isHorizontal;

  get title => product.title;

  get imageUrl => product.imageUrl;

  get publisherName => product.seller.name;

  get purchasePrice => product.purchasePrice;

  get rentPrice => product.rentPrice;

  get isFree => product.isFree;

  get viewCount => product.viewCount;

  final Product product;

  const ProductCard(
    this.product, {
    super.key,
    this.isHorizontal = true,
  });

  get blur => ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5);

  @override
  Widget build(BuildContext context) =>
      isHorizontal ? _buildHorizontalCard() : _buildVerticalCard();

  Widget _buildHorizontalCard() => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 160,
          child: Stack(
            children: [
              _bgImageFill(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      CupertinoColors.darkBackgroundGray.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: BackdropFilter(
                  filter: blur,
                  child: Row(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: _buildImage(),
                      ),
                      // const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8, right: 18),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildTextContent(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Positioned _bgImageFill() => Positioned.fill(
          child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ));

  Widget _buildVerticalCard() => ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          child: Stack(
            children: [
              _bgImageFill(),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      CupertinoColors.darkBackgroundGray.withOpacity(0.8),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: BackdropFilter(
                  filter: blur,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1,
                        child: _buildImage(),
                      ),
                      // const Flexible(fit: FlexFit.tight, child: SizedBox()),
                      SafeArea(
                          minimum: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildTextContent(),
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildImage() => ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      );

  List<Widget> _buildTextContent() =>
      [
        Text(
          title,
          // maxLines: 2,
          textAlign: TextAlign.right,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: CupertinoColors.white,
          ),
        ),
        const SizedBox(height: 3),
      ] +
      makePriceTagFor(product) +
      [
        // if (purchasePrice != null) makePriceTag(purchasePrice!, TradeType.sell),
        // if (rentPrice != null) makePriceTag(rentPrice!, TradeType.rent),
        // if (isFree) makePriceTag("免费", TradeType.free),
        Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: ((!product.seller.isMe
                    ? [
                        PhAvatar(name: publisherName, size: 16),
                        const SizedBox(width: 5),
                        Text(
                          publisherName,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 5)
                      ]
                    : <Widget>[]) +
                [
                  const Icon(CupertinoIcons.eye_fill,
                      color: Colors.white, size: 16),
                  const SizedBox(width: 5),
                  Text(
                    "${viewCount ?? 231}",
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  )
                ]))
      ];

  static List<Row> makePriceTagFor(Product p, {bool rtl = true}) => [
        if (p.purchasePrice != null)
          makePriceTag(p.purchasePrice!, TradeType.sell, rtl: rtl),
        if (p.rentPrice != null)
          makePriceTag(p.rentPrice!, TradeType.rent, rtl: rtl),
        if (p.isFree) makePriceTag("免费", TradeType.free, rtl: rtl),
      ];

  static Row makePriceTag(String price, TradeType t, {bool rtl = true}) => Row(
        mainAxisAlignment:
            rtl ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          makeBadge(t),
          const SizedBox(width: 5),
          Text(
            price,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: t.color,
            ),
          ),
        ],
      );

  static badges.Badge makeBadge(TradeType t, {Widget? child}) => badges.Badge(
      badgeContent: Text(t.oneWord,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          )),
      badgeStyle: badges.BadgeStyle(badgeColor: t.color),
      badgeAnimation: const badges.BadgeAnimation.fade(toAnimate: false),
      child: child);
}
