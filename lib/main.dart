import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/favourite_model.dart';
import 'package:provider_test/favourite_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => FavouriteModel(),
        child: MaterialApp(title: 'Flutter Demo', home: const FavouriteScreen()));
  }
}

