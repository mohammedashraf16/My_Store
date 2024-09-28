import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/home/data/model/home_category_model.dart';

abstract class HomeRepository{
  Future<Either<Failures,HomeSubCategoryModel>>getCategories();
}