import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';
import 'package:test/model/category_data_model.dart';
import 'package:test/screens/product_detail_screen.dart';
import 'package:test/model/product_data_model.dart';
import 'package:test/service/product_service.dart';
import 'package:test/widgets/product_card_widget.dart';

class ProductListingScreen extends StatelessWidget {
  static const String routeName = '/product-listing-screen';
  final ProductService _productService = ProductService();

  ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CategoryDataModel category = ModalRoute.of(context)!.settings.arguments as CategoryDataModel;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: Text(category.name ?? 'Unknown Category'),
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
                    onChanged: (value) {},
                  ),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder<ProductDataModel?>(
                future: _productService.fetchProductsByCategory(category.name ?? 'Unknown Category'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.products == null) {
                    return const Center(child: Text('No products found'));
                  }

                  final products = snapshot.data!.products!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${products.length} results found',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: kGreyColor,
                            ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                      ...products.map((product) {
                        return ProductCardWidget(
                          product: product!,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductDetailScreen(product: product),
                              ),
                            );
                          },
                        );
                      }),
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
