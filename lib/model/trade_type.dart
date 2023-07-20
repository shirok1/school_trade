import 'package:flutter/cupertino.dart';

enum TradeType {
  sell('卖', '出售', CupertinoColors.activeOrange),
  rent('租', '出租', CupertinoColors.activeBlue),
  free("送", "免费", CupertinoColors.activeGreen);

  const TradeType(this.oneWord, this.twoWord, this.color);

  final String oneWord, twoWord;
  final CupertinoDynamicColor color;
}

Map<TradeType, Widget> tradeTypesText =
    TradeType.values.asMap().map((_, t) => MapEntry(t, Text(t.twoWord)));
