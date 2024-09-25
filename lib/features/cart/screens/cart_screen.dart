import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/features/cart/widgets/cart_item_widget.dart';
import 'package:e_commerce/features/cart/widgets/total_price_and_checkout_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: getMediumStyle(fontSize: 20, color: ColorManager.textColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(
                IconsAssets.icSearch,
              ),
              color: ColorManager.primary,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage(IconsAssets.icCart),
              color: ColorManager.primary,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p14),
        child: Column(
          children: [
            Expanded(
              // the list of cart items ===============
              child: ListView.separated(
                itemBuilder: (context, index) => CartItemWidget(
                  imagePath: ImageAssets.categoryCardImage,
                  title: 'Nike Air Jordon',
                  price: 1500,
                  quantity: 1,
                  onDeleteTap: () {},
                  onDecrementTap: (value) {},
                  onIncrementTap: (value) {},
                  size: 40,
                  color: Colors.black,
                  colorName: 'Black',
                ),
                separatorBuilder: (context, index) =>
                    SizedBox(height: AppSize.s12.h),
                itemCount: 2,
              ),
            ),
            // the total price and checkout button========
            TotalPriceAndCheckoutBotton(
              totalPrice: 1200,
              checkoutButtonOnTap: () {},
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}
