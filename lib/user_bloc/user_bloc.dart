import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_list/models/product_models.dart';
import 'package:project_list/repositary/product_repositary.dart';
import "package:project_list/user_bloc/user_event.dart";
import 'package:project_list/user_bloc/user_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;
  List<Product> _allProducts = [];

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>(_onloadProducts);
    on<SearchProducts>(_onSearchProducts);
  }

  void _onloadProducts(LoadProducts event, Emitter<ProductState> emit) async {
    emit(ProductLoading());
    try {
      _allProducts = await repository.fetchProducts();
      emit(ProductLoaded(_allProducts));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }

  void _onSearchProducts(
      SearchProducts event, Emitter<ProductState> emit) async {
    final query = event.query.toLowerCase();
    final filtered = _allProducts
        .where((product) =>
            product.name.toLowerCase().contains(query) ||
            product.price.contains(query))
        .toList();
    emit(ProductLoaded(filtered));
  }
}
