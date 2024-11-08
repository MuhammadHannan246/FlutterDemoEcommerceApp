import 'package:flutter/material.dart';
import 'package:test/screens/categories_screen.dart';
import 'package:test/screens/favourite_products_screen.dart';
import 'package:test/screens/favourites_screen.dart';
import 'package:test/screens/product_detail_screen.dart';
import 'package:test/screens/product_listing_screen.dart';
import 'package:test/screens/products_screen.dart';
import 'package:test/screens/main_screen.dart';
import 'package:test/screens/profile_screen.dart';

class PageRoutes {
  Map<String, WidgetBuilder> routes() {
    return {
      MainScreen.routeName: (context) => const MainScreen(),
      ProductsScreen.routeName: (context) => const ProductsScreen(),
      CategoriesScreen.routeName: (context) => const CategoriesScreen(),
      FavouritesScreen.routeName: (context) => const FavouritesScreen(),
      FavouriteProductsScreen.routeName: (context) => const FavouriteProductsScreen(),
      ProfileScreen.routeName: (context) => const ProfileScreen(),
      ProductListingScreen.routeName: (context) => ProductListingScreen(),
      ProductDetailScreen.routeName: (context) => const ProductDetailScreen(),
    };
  }
}
