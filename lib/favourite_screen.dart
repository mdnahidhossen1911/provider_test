import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/en_screen.dart';
import 'package:provider_test/favourite_model.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favourite')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EnScreen()),
          );
        },
        child: Icon(Icons.arrow_forward_ios_sharp),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 1000,
              itemBuilder: (context, index) {
                return favItem(index);
              },
            ),
          ),
        ],
      ),
    );
  }

  Consumer<FavouriteModel> favItem(int index) {
    return Consumer<FavouriteModel>(
      builder: (context, value, child) => ListTile(
        title: Text('Item $index'),
        trailing: IconButton(
          onPressed: () {
            if (value.selectedIndex.contains(index)) {
              value.removeItem(index);
            } else {
              value.add(index);
            }
          },
          icon: Icon(
            value.selectedIndex.contains(index)
                ? Icons.favorite
                : Icons.favorite_border,
          ),
        ),
      ),
    );
  }
}
