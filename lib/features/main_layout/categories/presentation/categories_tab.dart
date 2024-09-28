import 'package:e_commerce/core/utils/values_manager.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:e_commerce/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryBloc>()..add(const GetCategoriesEvent()),
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return  Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p12, vertical: AppPadding.p12),
            child: Row(
              children: [
                CategoriesList(homeCategoryModel: state.homeCategoryModel,),
                const SizedBox(
                  width: AppSize.s16,
                ),
                 SubCategoriesList(subCategoryModel: state.categoryModel,)
              ],
            ),
          );
        },
      ),
    );
  }
}
