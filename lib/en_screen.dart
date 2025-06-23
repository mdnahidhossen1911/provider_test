import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/favourite_model.dart';

class EnScreen extends StatelessWidget {
  const EnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FAV')),
      body: Consumer<FavouriteModel>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.selectedIndex.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text('Item $index'),
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
                )
            );
          },
        ),
      ),
    );
  }
}
