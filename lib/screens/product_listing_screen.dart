import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/Model/product_data_model.dart';
import 'package:test/colors/colors.dart';
import 'package:test/widgets/product_card_widget.dart';

class ProductListingScreen extends StatelessWidget {
  static const String routeName = '/product-listing-screen';
  final String categoryName;

  const ProductListingScreen({Key? key, required this.categoryName})
      : super(key: key);

  Future<ProductDataModel?> fetchProducts() async {
    final response = await http.get(
        Uri.parse('https://dummyjson.com/products/category/$categoryName'));

    if (response.statusCode == 200) {
      return productDataModelFromJson(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
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
              FutureBuilder<ProductDataModel?>(
                future: fetchProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.products == null) {
                    return Center(child: Text('No products found'));
                  }

                  final products = snapshot.data!.products!;
                  // Display total number of products
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${products.length} results found',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: kGreyColor,
                            ),
                      ),
                      const SizedBox(height: 16),
                      // Displaying the list of products
                      ...products.map((product) {
                        return ProductCard(
                          productImage: product?.thumbnail ??
                              'assets/images/default_product.png',
                          productName: product?.title ?? 'No Name',
                          productRating: product?.rating ?? 0.0,
                          productPrice: product?.price ?? 0.0,
                          productBrand: 'By ${product?.brand ?? 'Unknown'}',
                          productCategory:
                              'In ${product?.category ?? 'Miscellaneous'}',
                        );
                      }).toList(),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
