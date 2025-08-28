import 'package:flutter/material.dart';
import "package:project_list/user_bloc/user_event.dart";
import 'package:project_list/user_bloc/user_state.dart';
import "package:project_list/user_bloc/user_bloc.dart";
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_list/screens/product_detail_screen.dart';
import 'package:project_list/screens/product_tile.dart';

class ProductListScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  ProductListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MWS"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (val) =>
                  context.read<ProductBloc>().add(SearchProducts(val)),
              decoration: const InputDecoration(
                hintText: 'Search by name or price...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            // ✅ Wrap ListView in Expanded
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProductLoaded) {
                  return ListView.builder(
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      final product = state.products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  ProductDetailScreen(product: product),
                            ),
                          );
                        },
                        child: ProductTile(product: product),
                      );
                    },
                  );
                } else if (state is ProductError) {
                  return Center(child: Text(state.message));
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
