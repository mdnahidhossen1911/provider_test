import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/controller/theme_changer.dart';
import 'package:provider_test/favourite_model.dart';
import 'package:provider_test/favourite_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('build main');
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => FavouriteModel()),
        ChangeNotifierProvider(create: (context) => ThemeChanger()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            themeMode: Provider.of<ThemeChanger>(context).mode,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              colorSchemeSeed: Colors.blueAccent
            ),
            theme: ThemeData(
                colorSchemeSeed: Colors.blueAccent
            ),
            home: const FavouriteScreen(),
          );
        }
      ),
    );
  }
}
