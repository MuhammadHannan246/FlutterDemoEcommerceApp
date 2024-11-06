import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';
import 'package:test/model/category_data_model.dart';
import 'package:test/screens/product_listing_screen.dart';

class CategoryCardWidget extends StatelessWidget {
  final CategoryDataModel category;

  const CategoryCardWidget({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListingScreen.routeName,
          arguments: category,
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: category.url != null
                  ? Image.network(
                      category.url!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/default_product.png',
                          width: double.infinity,
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Image.asset(
                      'assets/images/default_product.png',
                      fit: BoxFit.cover,
                    ),
            ),
            Container(
              decoration: BoxDecoration(
                color: kBlackColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  category.name ?? 'Unknown Category',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: kWhiteColor,
                        fontFamily: 'relative',
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
