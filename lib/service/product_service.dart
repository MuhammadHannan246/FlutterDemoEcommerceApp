import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/model/product_data_model.dart';

class ProductService {
  Future<ProductDataModel?> fetchProductData() async {
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));

      if (response.statusCode == 200) {
        return ProductDataModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      return null;
    }
  }

  Future<ProductDataModel?> fetchProductsByCategory(String categoryName) async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products/category/$categoryName'),
    );

    if (response.statusCode == 200) {
      return productDataModelFromJson(response.body);
    } else {
      throw Exception('Failed to load products for category: $categoryName');
    }
  }
}
