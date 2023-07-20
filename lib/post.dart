import 'package:flutter/cupertino.dart';

import 'card.dart';
import 'model/trade_type.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  TradeType postTradeType = TradeType.sell;

  bool isEditingTitle = false;
  bool isEditingDetails = false;
  bool isEditingPrice = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('发布'),
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  isEditingTitle = true;
                });
              },
              child: isEditingTitle
                  ? CupertinoTextField(
                      controller: titleController,
                      placeholder: '添加标题',
                      onTapOutside: (text) {
                        setState(() {
                          isEditingTitle = false;
                        });
                      },
                      onSubmitted: (text) {
                        setState(() {
                          isEditingTitle = false;
                        });
                      },
                    )
                  : Text(
                      titleController.text.isEmpty
                          ? '添加标题'
                          : titleController.text,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      )),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  isEditingDetails = true;
                });
              },
              child: isEditingDetails
                  ? CupertinoTextField(
                      controller: detailsController,
                      placeholder: '商品详情',
                      maxLines: 3,
                      onTapOutside: (text) {
                        setState(() {
                          isEditingDetails = false;
                        });
                      },
                      onSubmitted: (text) {
                        setState(() {
                          isEditingDetails = false;
                        });
                      },
                    )
                  : Text(
                      detailsController.text.isEmpty
                          ? '描述型号，入手渠道，转手原因...'
                          : detailsController.text,
                      style: const TextStyle(
                        color: CupertinoColors.inactiveGray,
                      )),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 200,
              color: CupertinoColors.placeholderText,
              child: const Center(
                child: Text('点击上传商品图片',
                    style: TextStyle(color: CupertinoColors.white)),
              ),
            ),
            const SizedBox(height: 20),
            CupertinoSlidingSegmentedControl<TradeType>(
              // children: postTypes.map((key, value) => MapEntry(key, Text(value))),
              children: tradeTypesText,
              onValueChanged: (TradeType? value) {
                setState(() {
                  postTradeType = value ?? TradeType.sell;
                  // setPriceControllerEditable();
                });
              },
              groupValue: postTradeType,
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                setState(() {
                  if (postTradeType != TradeType.free) {
                    isEditingPrice = true;
                  }
                });
              },
              child: isEditingPrice
                  ? CupertinoTextField(
                      enabled: postTradeType != TradeType.free,
                      controller: priceController,
                      placeholder: '价格',
                      onTapOutside: (text) {
                        setState(() {
                          isEditingPrice = false;
                        });
                      },
                      onSubmitted: (text) {
                        setState(() {
                          isEditingPrice = false;
                        });
                      },
                    )
                  : ProductCard.makePriceTag(
                      postTradeType != TradeType.free
                          ? (priceController.text.isEmpty
                              ? '点击输入价格'
                              : "¥${priceController.text}")
                          : "免费",
                      postTradeType, rtl: false),
            ),
            const SizedBox(height: 20),
            CupertinoButton.filled(
              child: const Text('发布'),
              onPressed: () {
                // 添加你的发布逻辑
              },
            )
          ],
        ),
      ),
    );
  }
// void setPriceControllerEditable(){
//   if(segmentedControlValue==PostType.free){
//     priceController.text = "";
//   }
// }
}
