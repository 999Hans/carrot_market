import 'package:carrot_market/screens/home/components/product_detail.dart';
import 'package:flutter/material.dart';

import '../../../models/product.dart';

class ProductItem extends StatelessWidget {
  Product product;
  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135.0,
      padding: EdgeInsets.all(16),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.network(
            product.urlToImage,
            width: 115,
            height: 115,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        ProductDetail(product: product)
      ]),
    );
  }
}
