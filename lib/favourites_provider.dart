import 'package:flutter/material.dart';
import 'webtoon.dart';

class FavoritesProvider with ChangeNotifier {
  final List<Webtoon> _favorites = [];

  List<Webtoon> get favorites => _favorites;

  void addToFavorites(Webtoon webtoon) {
    if (!_favorites.contains(webtoon)) {
      _favorites.add(webtoon);
      notifyListeners();
    }
  }

  void removeFromFavorites(Webtoon webtoon) {
    _favorites.remove(webtoon);
    notifyListeners();
  }

  bool isFavorite(Webtoon webtoon) {
    return _favorites.contains(webtoon);
  }
}
