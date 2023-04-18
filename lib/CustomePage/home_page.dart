// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/cors/store.dart';
import 'package:my_app/moduls/cart.dart';
import 'package:my_app/utils/routes.dart';
import 'package:my_app/widgets/drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:my_app/moduls/catalog.dart';
import '../widgets/home_widgets/shop_header.dart';
import '../widgets/home_widgets/shop_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    print(productData);
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      appBar: AppBar(
        title: "Shop Now".text.xl3.bold.make(),
      ),
      backgroundColor: context.cardColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (context, _, __) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.black,
          ),
        ).badge(
            color: Vx.red400,
            size: 22,
            count: _cart.items.length,
            textStyle: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 8, right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [ShopHeader(), ShopList().py8().expand()],
        ),
      ),
      endDrawer: MyDrawer(),
    );
  }
}
