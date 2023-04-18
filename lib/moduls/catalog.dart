import 'dart:convert';

class CatalogModel {
  static List<Item> items = CatalogModel.items;

  //get item by id
  Item getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //Get Item by Possition
  Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String description;
  final String color;
  final String image;
  final int price;

  Item({
    required this.id,
    required this.name,
    required this.description,
    required this.color,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'color': color,
      'image': image,
      'price': price,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      color: map['color'] as String,
      image: map['image'] as String,
      price: map['price'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, name: $name, description: $description, color: $color, image: $image, price: $price)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.description == description &&
        other.color == color &&
        other.image == image &&
        other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        description.hashCode ^
        color.hashCode ^
        image.hashCode ^
        price.hashCode;
  }

  toList() {}
}
