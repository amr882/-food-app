import 'package:flutter/material.dart';
import 'package:food_app/models/item_model.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<FoodModel> _favorites = [];
  List<FoodModel> get favorites => _favorites;
  void toggleFavorite(FoodModel foodItem) {
    if (_favorites.contains(foodItem)) {
      _favorites.remove(foodItem);
    } else {
      _favorites.add(foodItem);
    }
    notifyListeners();
  }

  bool isExist(FoodModel foodItem) {
    final isExist = _favorites.contains(foodItem);
    return isExist;
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
