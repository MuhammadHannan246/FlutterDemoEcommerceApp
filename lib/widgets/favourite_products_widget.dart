import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';

class FavouriteProductsWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double price;
  final double rating;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const FavouriteProductsWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.rating,
    required this.isFavorite,
    required this.onFavoriteToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(8.0),
        ),
        side: BorderSide(color: kGreyColor.withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.0,
            backgroundColor: kGreyColor,
            child: ClipOval(
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Icon(Icons.error),
              ),
            ),
          ),
          title: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: kBlackColor,
                ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '\$${price.toStringAsFixed(2)}', // Format price to two decimal places
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kBlackColor,
                    ),
              ),
              Row(
                children: [
                  Text(
                    rating.toString(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: kBlackColor,
                        ),
                  ),
                ],
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : null,
            ),
            onPressed: onFavoriteToggle,
          ),
          onTap: () {
            // Add navigation or other functionality here
          },
        ),
      ),
    );
  }
}
