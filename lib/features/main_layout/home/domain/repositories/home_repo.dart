import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/home/data/model/home_cat_model.dart';

abstract class HomeRepository{
  Future<Either<Failures,HomeCategoryModel>>getCategories();
}