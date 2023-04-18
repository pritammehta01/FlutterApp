import 'package:flutter/material.dart';
import 'package:my_app/cors/store.dart';
import 'package:my_app/moduls/cart.dart';
import 'package:my_app/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.cardColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
      endDrawer: MyDrawer(),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: {},
            mutations: {RemoveMutation},
            builder: (context, _, __) {
              return "\₹${_cart.totalPrice}"
                  .text
                  .xl4
                  .color(context.canvasColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: "Buying Not Supported yet".text.make()));
              },
              child: "Buy".text.make())
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to Show".text.xl2.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () => RemoveMutation(_cart.items[index]),
                  icon: Icon(Icons.remove_circle_outline)),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
