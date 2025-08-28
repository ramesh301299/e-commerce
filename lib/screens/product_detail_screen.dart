import 'package:flutter/material.dart';
import 'package:project_list/models/product_models.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          Image.network(
            product.imageLink,
            height: 200,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            product.brand,
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "Amount : ${product.price}",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Text("Rating : ${product.rating}"),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Text(product.description),
            ),
          ),
        ]),
      ),
    );
  }
}
