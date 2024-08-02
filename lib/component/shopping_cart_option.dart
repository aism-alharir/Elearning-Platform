import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/util/util.dart';
import 'package:flutter/material.dart';

class ShoppingCartOption extends StatelessWidget {
  const ShoppingCartOption({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColor.kPrimaryColor,
      onPressed: () {
        Util.openShoppingCart(context);
      },
      child: const Icon(Icons.shopping_cart),
    );
  }
}
