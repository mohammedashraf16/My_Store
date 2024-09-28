import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';

abstract class CategoryRepo{


  Future<Either<Failures,SubCategoryModel>> getSubCategories(String catId);
}