import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/components/product_counter.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductRating extends StatelessWidget {
  final String productBuyers;
  final String productRating;
  const ProductRating({super.key , required this.productBuyers , required this.productRating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(
                color: ColorManager.primary.withOpacity(.3),
                width: 1),
            borderRadius: BorderRadius.circular(20.r),
          ),
          padding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: Text(
            '$productBuyers Sold',
            overflow: TextOverflow.ellipsis,
            style: getMediumStyle(color: ColorManager.primary)
                .copyWith(fontSize: 18.sp),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
        Image.asset(
          ImageAssets.rate,
          width: 30.w,
        ),
        SizedBox(
          width: 4.w,
        ),
        Expanded(
          child: Text(
            productRating,
            overflow: TextOverflow.ellipsis,
            style:
            getMediumStyle(color: ColorManager.appBarTitleColor)
                .copyWith(fontSize: 14.sp),
          ),
        ),
        ProductCounter(add: (_) {}, remove: (_) {}, productCounter: 1)
      ],
    );
  }
}
