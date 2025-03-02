import 'package:flutter/material.dart';
import 'package:inventory_app/models/response_item.dart';
import 'package:inventory_app/services/item_services.dart';

class HomeProvider extends ChangeNotifier {
  final ItemServices _itemServices = ItemServices();
  HomeProvider() {
    _isLoading = false;
    _getItems();
  }

  late bool _isLoading;
  bool get isLoading => _isLoading;
  set isLoading(bool newValue) {
    _isLoading = newValue;
    notifyListeners();
  }

  List<Barang> listItems = [];

  void _getItems() async {
    isLoading = true;

    final result = await _itemServices.getItems();
    listItems = result.barang ?? [];

    isLoading = false;
  }
}
