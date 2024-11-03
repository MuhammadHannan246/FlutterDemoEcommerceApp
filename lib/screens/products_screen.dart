import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/Model/product_data_model.dart';
import 'dart:convert';
import 'package:test/colors/colors.dart';
import 'package:test/widgets/product_card_widget.dart';

class ProductsScreen extends StatefulWidget {
  static const String routeName = '/products';
  const ProductsScreen({super.key});

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late Future<ProductDataModel?> _productData;

  // Fetch product data from API
  Future<ProductDataModel?> fetchProductData() async {
    try {
      final response =
          await http.get(Uri.parse('https://dummyjson.com/products?limit=100'));

      if (response.statusCode == 200) {
        return ProductDataModel.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print('Error fetching data: $e');
      return null; // Return null if an error occurs
    }
  }

  @override
  void initState() {
    super.initState();
    _productData = fetchProductData();
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
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      hintText: 'Search here',
                      border: InputBorder.none,
                    ),
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
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data?.products == null ||
                      snapshot.data!.products!.isEmpty) {
                    return const Center(child: Text('No products found'));
                  } else {
                    return Column(
                      children: snapshot.data!.products!.map((product) {
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
