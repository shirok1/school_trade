import 'package:flutter/cupertino.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'card.dart';
import 'model/product.dart';
import 'product_detail.dart';

class ProductColumn extends StatelessWidget {
  final List<Product> data;

  const ProductColumn({super.key, required this.data});

  @override
  Widget build(BuildContext context) => Column(
      children: data
          .map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                child: ProductCard(p),
                onPressed: () => {
                  Navigator.push(
                    context,
                    SwipeablePageRoute(
                      builder: (context) => ProductDetailsPage(p),
                    ),
                  )
                },
              ),
            ),
          )
          .toList(),
    );
}
