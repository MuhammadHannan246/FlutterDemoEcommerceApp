import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';
import 'package:test/model/product_data_model.dart';

class FavouriteProductWidget extends StatefulWidget {
  final Product? product;

  const FavouriteProductWidget({
    super.key,
    required this.product,
  });

  @override
  State<FavouriteProductWidget> createState() => _FavouriteProductWidgetState();
}

class _FavouriteProductWidgetState extends State<FavouriteProductWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: kWhiteColor,
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
              child: widget.product != null
                  ? widget.product!.thumbnail != null
                      ? Image.network(
                          widget.product!.thumbnail!,
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
                        )
                  : Container(),
            ),
          ),
          title: Text(
            widget.product?.title ?? 'Unknown Product',
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
                '\$${widget.product?.price ?? 0.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: kBlackColor,
                    ),
              ),
              Row(
                children: [
                  Text(
                    '${widget.product?.rating ?? 0.0}',
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
              color: isFavorite ? kRedColor : kGreyColor,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
          ),
        ),
      ),
    );
  }
}
