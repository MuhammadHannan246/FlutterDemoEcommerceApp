import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';

class ProductsScreen extends StatelessWidget {
  static const String routeName = '/products';
  const ProductsScreen({super.key});

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
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  '234 results found',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kGreyColor,
                      ),
                ),
              ),
              ProductCard(
                productImage: 'assets/images/product_image.png',
                productName: 'Product Name',
                productRating: 4.5,
                productPrice: 29.99,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final double productRating;
  final double productPrice;

  const ProductCard({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productRating,
    required this.productPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                productImage,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              productName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  '$productRating',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '\$$productPrice',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
