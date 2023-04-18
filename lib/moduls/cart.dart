// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:velocity_x/velocity_x.dart';

import 'package:my_app/cors/store.dart';
import 'package:my_app/moduls/catalog.dart';

class CartModel {
  // catalog field
  late CatalogModel _catalog;

  //colection of Ids-store ids of each items
  final List<int> _itemIds = [];

  //get catalog
  CatalogModel get catalog => _catalog;
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

// get items in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;
  AddMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;
  RemoveMutation(this.item);

  @override
  perform() {
    store!.cart._itemIds.remove(item.id);
  }
}
