import 'package:flutter/material.dart';
import 'package:test/colors/colors.dart';
import 'package:test/screens/categories_screen.dart';
import 'package:test/screens/favourites_screen.dart';
import 'package:test/screens/products_screen.dart';
import 'package:test/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  final int? selectedPage;
  static const routeName = '/tabs-screen';

  const MainScreen({super.key, this.selectedPage});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPageIndex = 0;

  final List<Widget> pages = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavouritesScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    if (widget.selectedPage != null) {
      selectedPageIndex = widget.selectedPage!;
    }
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  Widget _buildAppBarTitle() {
    switch (selectedPageIndex) {
      case 0:
        return Center(
          child: Text(
            'Products',
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );

      case 1:
        return Center(
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      case 2:
        return Center(
          child: Text(
            'Favoruites',
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      case 3:
        return Center(
          child: Text(
            'Mit Konto',
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
      default:
        return Center(
          child: Text(
            'My Store',
            style: Theme.of(context).textTheme.headlineSmall,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _buildAppBarTitle(),
      ),
      body: pages[selectedPageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(8.0),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            BottomNavigationBar(
              selectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(inherit: true),
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(inherit: true),
              currentIndex: selectedPageIndex,
              onTap: selectPage,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.music_note), label: 'Products'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.podcasts), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.videocam), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.movie), label: 'Mit Konto'),
              ],
            ),
            Positioned(
              left: (MediaQuery.of(context).size.width / 4) * selectedPageIndex,
              right: (MediaQuery.of(context).size.width / 4) *
                  (3 - selectedPageIndex),
              top: 0,
              bottom: 0,
              child: Container(
                color: kWhiteColor.withOpacity(0.08),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
