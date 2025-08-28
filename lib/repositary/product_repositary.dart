import "dart:convert";
import "package:http/http.dart" as http;
import "package:project_list/models/product_models.dart";

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    final url = Uri.parse(
        "https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline");

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as List;
        return data.map((e) => Product.fromJson(e)).toList();
      } else {
        throw Exception("Error handling To Load Products");
      }
    } catch (e) {
      throw Exception("Error handling : $e");
    }
  }
}
