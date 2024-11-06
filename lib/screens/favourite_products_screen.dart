import 'package:flutter/material.dart';
import 'package:test/model/product_data_model.dart';
import 'package:test/colors/colors.dart';
import 'package:test/service/product_service.dart';
import 'package:test/widgets/favourite_product_widget.dart';

class FavouriteProductsScreen extends StatefulWidget {
  static const String routeName = '/favourite_products_screen';

  const FavouriteProductsScreen({super.key});

  @override
  State<FavouriteProductsScreen> createState() => _FavouriteProductsScreenState();
}

class _FavouriteProductsScreenState extends State<FavouriteProductsScreen> {
  final ProductService _productService = ProductService();
  Future<ProductDataModel?>? _productData;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _productData = _productService.fetchProductData();
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
                  dense: true,
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
                      setState(() {
                        _searchQuery = value.toLowerCase();
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FutureBuilder<ProductDataModel?>(
                future: _productData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data?.products == null || snapshot.data!.products!.isEmpty) {
                    return const Center(child: Text('No products found'));
                  } else {
                    // Filter products based on search query
                    final products = snapshot.data!.products!.where((product) => product!.title!.toLowerCase().contains(_searchQuery)).toList();

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
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return FavouriteProductWidget(product: product);
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
