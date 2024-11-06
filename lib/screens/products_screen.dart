import 'package:flutter/material.dart';
import 'package:test/model/product_data_model.dart';
import 'package:test/colors/colors.dart';
import 'package:test/screens/product_detail_screen.dart';
import 'package:test/service/product_service.dart';
import 'package:test/widgets/product_card_widget.dart';

class ProductsScreen extends StatefulWidget {
  static const String routeName = '/products-screen';
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductService _productService = ProductService();
  late Future<ProductDataModel?> _productData;

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
                future: _productData,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data?.products == null || snapshot.data!.products!.isEmpty) {
                    return const Center(child: Text('No products found'));
                  } else {
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
                            productImage: product?.thumbnail ?? 'assets/images/default_product.png',
                            productName: product?.title ?? 'Unknown Product',
                            productRating: product?.rating ?? 0.0,
                            productPrice: product?.price ?? 0.0,
                            productBrand: 'By ${product?.brand ?? 'Unknown'}',
                            productCategory: 'In ${product?.category ?? 'Miscellaneous'}',
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProductDetailScreen(product: product!),
                                ),
                              );
                            },
                          );
                        }),
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
