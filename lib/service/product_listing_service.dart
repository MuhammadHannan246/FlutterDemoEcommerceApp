import 'package:http/http.dart' as http;
import 'package:test/Model/product_data_model.dart';

class ProductListingService {
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
