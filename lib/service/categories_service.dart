import 'package:http/http.dart' as http;
import 'package:test/model/categories_data_model.dart';

class CategoryService {
  final String _baseUrl = 'https://dummyjson.com/products/categories';

  Future<List<CategoryDataModel>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        return categoriesDataModelFromJson(response.body);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print('Error fetching categories: $e');
      return [];
    }
  }
}
