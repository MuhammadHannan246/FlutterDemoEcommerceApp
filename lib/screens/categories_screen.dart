import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  static const String routeName = '/categories';
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('This is categories.'),
      ),
    );
  }
}
