import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/data/models/category_model.dart';

abstract class CategoryRepository{
  Future<Either<Failures,CategoryModel>>getCategories();
}