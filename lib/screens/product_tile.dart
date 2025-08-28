import 'package:flutter/material.dart';
import 'package:project_list/models/product_models.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: Image.network(product.imageLink, width: 50),
        title: Text(product.name),
        subtitle: Text("Rupees ${product.price} "),
      ),
    );
  }
}
