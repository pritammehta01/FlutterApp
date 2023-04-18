import 'package:flutter/material.dart';
import 'package:my_app/moduls/catalog.dart';
import 'package:my_app/widgets/drawer.dart';
import 'package:my_app/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: context.cardColor,
        padding: EdgeInsets.zero,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "₹${catalog.price}".text.bold.xl3.red700.make(),
            AddToCart(catalog: catalog)
          ],
        ).p24(),
      ),
      backgroundColor: context.cardColor,
      body: Column(
        children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image))
              .h32(context),
          Expanded(
              child: VxArc(
                  height: 30,
                  edge: VxEdge.TOP,
                  arcType: VxArcType.CONVEY,
                  child: Container(
                    width: context.screenWidth,
                    color: context.cardColor,
                    child: Column(
                      children: [
                        catalog.name.text.xl3
                            .color(context.canvasColor)
                            .bold
                            .make(),
                        catalog.description.text.xl.make(),
                        10.heightBox,
                        "Dolore kasd magna vero ipsum no, aliquyam duo sed amet sed lorem sit et nonumy, dolor sadipscing justo kasd est duo. Lorem eos erat clita lorem sadipscing. Eos ipsum gubergren duo clita, sed stet ea diam aliquyam ut et sed magna. Tempor vero est ut erat ipsum no voluptua clita.."
                            .text
                            .make()
                            .p16()
                      ],
                    ).py64(),
                  )))
        ],
      ),
      endDrawer: MyDrawer(),
    );
  }
}
