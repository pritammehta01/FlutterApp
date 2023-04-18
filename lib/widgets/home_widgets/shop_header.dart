import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ShopHeader extends StatelessWidget {
  const ShopHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: ["Trending Products".text.xl.semiBold.make()],
    );
  }
}
