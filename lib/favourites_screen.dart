import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favourites_provider.dart';


class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final favorites = favoritesProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.deepPurple,
      ),
      body: favorites.isEmpty
          ? const Center(child: Text('No favorites added yet.'))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final webtoon = favorites[index];
                return ListTile(
                  leading: Image.asset(webtoon.imageUrl, width: 50, height: 50),
                  title: Text(webtoon.title),
                  subtitle: Text(webtoon.category),
                );
              },
            ),
    );
  }
}
