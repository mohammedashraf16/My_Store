import 'package:e_commerce/features/main_layout/categories/data/models/category_model.dart';

abstract class CategoryRemoteDS{
  Future<CategoryModel> getCategory();
}