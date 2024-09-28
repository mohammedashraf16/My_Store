import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';
import 'package:e_commerce/features/main_layout/categories/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoryUseCase {
 CategoryRepo repository;

 GetSubCategoryUseCase(this.repository);

 Future<Either<Failures, SubCategoryModel>> call(String catId) =>
     repository.getSubCategories(catId);
}