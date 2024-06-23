import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopitem = [
    ["apple", "50.00", "lib/images/apple.png", Colors.green],
    ["banana", "100.00", "lib/images/banana.png", Colors.yellow],
    ["kiwi", "150.00", "lib/images/kiwi.png", Colors.yellow],
    ["orange", "200.00", "lib/images/orange.png", Colors.green],
    ["cherry", "250.00", "lib/images/cherry.png", Colors.green],
    ["mango", "300.00", "lib/images/mango.png", Colors.yellow],
    ["watermelon", "350.00", "lib/images/watermelon.png", Colors.yellow],
    ["dragonfruit", "400.00", "lib/images/dragonfruit.png", Colors.green],
  ];

  List _cartitem = [];

  get shopitem => _shopitem;
  get cartitem => _cartitem;

  void additemtocart(int index) {
    _cartitem.add(_shopitem[index]);
    notifyListeners();
  }

  void removeitemtocart(int index) {
    _cartitem.removeAt(index);
    notifyListeners();
  }

  String calculatetotal() {
    double totalprice = 0;

    for (int i = 0; i < _cartitem.length; i++) {
      totalprice += double.parse(_cartitem[i][1]);
    }
    return totalprice.toStringAsFixed(2);
  }
}
