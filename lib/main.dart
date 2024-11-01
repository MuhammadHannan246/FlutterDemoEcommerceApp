import 'package:flutter/material.dart';
import 'package:test/routes/routes.dart';
import 'package:test/screens/main_screen.dart';
import 'package:test/themes/theme_style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Store',
      theme: ThemeStyle.darkTheme,
      initialRoute: MainScreen.routeName,
      routes: PageRoutes().routes(),
    );
  }
}
