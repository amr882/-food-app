import 'package:flutter/material.dart';
import 'package:food_app/models/item_model.dart';

class CartProvider extends ChangeNotifier {
  List<FoodModel> _cart = [];
  List<FoodModel> orders = [];
  List<FoodModel> get cart => _cart;

  set food(List<FoodModel> value) => _cart = value;

// add to cart
  void addToCart(FoodModel foodItem, int quantity) {
    bool isNew = true;
    for (var f in _cart) {
      if (f.id == foodItem.id) {
        isNew = false;
        f.quantity += quantity;
        continue;
      }
    }
    if (isNew) {
      foodItem.quantity = quantity;
      foodItem.orderDate = DateTime.now();
      _cart.add(foodItem);
    }
    updateQuantityInCart(foodItem, foodItem.quantity);
    notifyListeners();
  }

  void updateQuantityInCart(FoodModel foodItem, int newQuantity) {
    if (_cart.isEmpty) return;
    for (int i = 0; i < _cart.length; i++) {
      if (_cart[i] == foodItem) {
        _cart[i].quantity = newQuantity;
        notifyListeners();
        return;
      }
    }
  }

  // remove from cart
  void removeFromCart(FoodModel foodItem) {
    _cart.remove(foodItem);
    notifyListeners();
  }

  //total price
  String calculate() {
    double totalPrice = 0.0;
    for (var item in _cart) {
      totalPrice += (item.price * item.quantity) + 5;
    }
    return totalPrice.toStringAsFixed(2);
  }

//order's total price
  String orderPrice() {
    double totalPrice = 0.0;
    for (var item in orders) {
      totalPrice += (item.price * item.quantity) + 5;
    }
    return totalPrice.toStringAsFixed(2);
  }

  // remove from cart

  List<FoodModel> moveCartToOrder() {
    for (var item in _cart) {
      orders.add(item);
    }
    _cart = [];
    notifyListeners();
    return orders;
  }
}
