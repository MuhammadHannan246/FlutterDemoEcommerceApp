import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:test/colors/colors.dart';
import 'package:test/model/product_data_model.dart';
import 'package:test/constants/constants.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-detail-screen';
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isWishlisted = false;

  @override
  void initState() {
    super.initState();
    isWishlisted = wishlist.contains(widget.product);
  }

  void toggleWishlist() {
    setState(() {
      if (isWishlisted) {
        wishlist.remove(widget.product);
      } else {
        wishlist.add(widget.product);
      }
      isWishlisted = !isWishlisted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Image.network(
                  widget.product.thumbnail!,
                  width: double.infinity,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Details:',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(fontFamily: 'poppins'),
                    ),
                    IconButton(
                      icon: Icon(
                        isWishlisted ? Icons.favorite : Icons.favorite_border,
                        color: isWishlisted ? kRedColor : kGreyColor,
                      ),
                      onPressed: toggleWishlist,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${widget.product.title}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '\$${widget.product.price}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${widget.product.category}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Brand: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${widget.product.brand}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rating: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${widget.product.rating}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(width: 4),
                    RatingBarIndicator(
                      rating: widget.product.rating!,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: kAmberColor,
                      ),
                      itemCount: 5,
                      itemSize: 16.0,
                      direction: Axis.horizontal,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Stock: ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      '${widget.product.stock}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Description:',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  '${widget.product.description}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Product Gallery:',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              if (widget.product.images != null && widget.product.images!.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.product.images!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: CachedNetworkImage(
                            imageUrl: widget.product.images![index],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (widget.product.images == null || widget.product.images!.isEmpty)
                Text(
                  'No images available',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
