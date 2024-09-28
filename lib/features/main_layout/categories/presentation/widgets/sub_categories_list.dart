import 'package:e_commerce/config/routes_manager/routes.dart';
import 'package:e_commerce/core/utils/assets_manager.dart';
import 'package:e_commerce/core/utils/color_manager.dart';
import 'package:e_commerce/core/utils/font_manager.dart';
import 'package:e_commerce/core/utils/styles_manager.dart';
import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';
import 'package:e_commerce/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';

import 'sub_category_item.dart';

class SubCategoriesList extends StatefulWidget {
  SubCategoryModel? subCategoryModel;
   SubCategoriesList({super.key,required this.subCategoryModel});

  @override
  State<SubCategoriesList> createState() => _SubCategoriesListState();
}

class _SubCategoriesListState extends State<SubCategoriesList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: CustomScrollView(
        slivers: <Widget>[
          // category title
          SliverToBoxAdapter(
            child: Text(
              'Laptops & Electronics',
              style: getBoldStyle(
                  color: ColorManager.primary, fontSize: FontSize.s14),
            ),
          ),
          // the category card
          SliverToBoxAdapter(
            child: CategoryCardItem("Laptops & Electronics",
                ImageAssets.categoryCardImage, goToCategoryProductsListScreen),
          ),
          // the grid view of the subcategories
          SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: widget.subCategoryModel?.data?.length??0,
                (context, index) => InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.productsScreenRoute,arguments: widget.subCategoryModel?.data?[index].category);
                  },
                  child: SubCategoryItem(
                      widget.subCategoryModel?.data?[index].name?.split(" ").first??"Not Found",
                      ImageAssets.subcategoryCardImage,
                      ),
                ),
              ),
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.75,
                mainAxisSpacing: AppSize.s8,
                crossAxisSpacing: AppSize.s8,
              ))
        ],
      ),
    );
  }

  goToCategoryProductsListScreen() {

  }
}
