import 'package:flutter/material.dart';

import '../moduls/catalog.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print("presed");
        },
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text(
          "\₹${item.price}",
          textScaleFactor: 1.2,
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
      ),
    );
  }
}
