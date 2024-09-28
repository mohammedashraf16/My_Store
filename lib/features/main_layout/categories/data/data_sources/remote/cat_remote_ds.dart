
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';

abstract class CategoryDS {
  Future<SubCategoryModel> getSubCategories(String catId);
}