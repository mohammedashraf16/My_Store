import 'package:e_commerce/features/main_layout/home/data/model/home_cat_model.dart';

abstract class HomeCategoryDS{
  Future<HomeCategoryModel> getHomeCategories();
}