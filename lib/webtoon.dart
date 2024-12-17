class Webtoon {
  final String title;
  final String imageUrl;
  final String description;
  final String category;
  List<double> ratings = []; // List to hold ratings from users
  double averageRating = 0.0; // Initial average rating

  Webtoon({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.category,
    required this.initialRating, // Add initial rating
  }) {
    // Initialize with an initial rating
    if (initialRating > 0) {
      ratings.add(initialRating.toDouble());
      averageRating = initialRating.toDouble(); // Set initial average rating
    }
  }

  final double initialRating; // Change to double for initial rating

  void addRating(double rating) {
    ratings.add(rating);
    averageRating = ratings.reduce((a, b) => a + b) / ratings.length; // Calculate average
  }
}
class WebtoonCategory {
  final String title;
  final String imageUrl;

  WebtoonCategory(this.title, this.imageUrl);
}


