import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favourites_provider.dart';
import 'webtoon.dart';

class DetailsScreen extends StatefulWidget {
  final Webtoon webtoon;

  const DetailsScreen({super.key, required this.webtoon});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  double _userRating = 0; // Use double for user rating

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final isFavorite = favoritesProvider.isFavorite(widget.webtoon);

    final averageRating = widget.webtoon.averageRating;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.webtoon.title),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(widget.webtoon.imageUrl, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'About ${widget.webtoon.title}',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              widget.webtoon.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              'Average Rating: ${averageRating.toStringAsFixed(1)} / 5',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Rate this Webtoon:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            _buildRatingStars(), // Display stars for rating
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (isFavorite) {
                    favoritesProvider.removeFromFavorites(widget.webtoon);
                  } else {
                    favoritesProvider.addToFavorites(widget.webtoon);
                  }
                },
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                label: Text(isFavorite ? 'Remove from Favorites' : 'Add to Favorites'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build star rating widget with half stars
  Widget _buildRatingStars() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          double starValue = (index + 1) / 2; // Calculate star value (0.5, 1.0, ..., 5.0)
          return IconButton(
            icon: Icon(
              starValue <= _userRating ? Icons.star : Icons.star_border,
              color: Colors.yellow,
            ),
            onPressed: () {
              setState(() {
                _userRating = starValue; // Update user rating with half star support
                widget.webtoon.addRating(_userRating); // Add rating to webtoon
              });
            },
          );
        }),
      ),
    );
  }
}


