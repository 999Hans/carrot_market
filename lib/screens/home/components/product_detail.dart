import 'package:carrot_market/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/product.dart';

class ProductDetail extends StatelessWidget {
  Product product;
  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          style: textTheme().bodyText1,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text('${product.address} - ${product.publishedAt}'),
        SizedBox(
          height: 4.0,
        ),
        Text(
          '${numberFormat(product.price)}원',
          style: textTheme().headline2,
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
                visible: product.commentsCount > 0,
                child: _buildIcons(
                    product.commentsCount, CupertinoIcons.chat_bubble_2)),
            Visibility(
                visible: product.heartCount > 0,
                child: _buildIcons(product.heartCount, CupertinoIcons.heart))
          ],
        )
      ],
    ));
  }
}

Widget _buildIcons(int count, IconData iconData) {
  return Row(
    children: [
      Icon(
        iconData,
        size: 14.0,
      ),
      SizedBox(
        width: 4.0,
      ),
      Text('$count')
    ],
  );
}

String numberFormat(String price) {
  final formatter = NumberFormat('#,###');
  return formatter.format(int.parse(price));
}
