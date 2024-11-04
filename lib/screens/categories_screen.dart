import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';
import 'package:test/screens/product_listing_screen.dart';
import 'package:test/widgets/category_card_widget.dart';
import 'package:test/Model/categories_data_model.dart';
import 'package:http/http.dart' as http;

class CategoriesScreen extends StatefulWidget {
  static const String routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late Future<List<CategoriesDataModel>> _categories;

  Future<List<CategoriesDataModel>> fetchCategories() async {
    try {
      final response = await http
          .get(Uri.parse('https://dummyjson.com/products/categories'));

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

  @override
  void initState() {
    super.initState();
    _categories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: kBlackColor, width: 1.5),
                ),
                child: ListTile(
                  leading: const Icon(Icons.search_sharp),
                  title: TextField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search here',
                      hintStyle: Theme.of(context).textTheme.bodySmall,
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    onChanged: (value) {
                      print("Search query: $value");
                    },
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder<List<CategoriesDataModel>>(
                future: _categories,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No categories found'));
                  } else {
                    final categories = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${categories.length} results found',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: kGreyColor,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.0,
                            childAspectRatio: 2 / 2,
                          ),
                          itemBuilder: (context, index) {
                            final category = categories[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductListingScreen(
                                      categoryName:
                                          category.name ?? 'Unknown Category',
                                    ),
                                  ),
                                );
                              },
                              child: CategoryCardWidget(
                                imageUrl: category.url ??
                                    'assets/images/default_product.png',
                                categoryName:
                                    category.name ?? 'Unknown Category',
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
