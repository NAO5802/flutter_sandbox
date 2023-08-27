import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'catalog.dart';

class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;
  final List<Item> _items = [];

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog){
    _catalog = newCatalog;
    notifyListeners();
  }

  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}