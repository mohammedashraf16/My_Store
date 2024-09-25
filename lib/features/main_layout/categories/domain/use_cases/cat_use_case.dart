import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/data/models/category_model.dart';
import 'package:e_commerce/features/main_layout/categories/domain/repository/category_repository.dart';

class GetCategoryUseCase {
  CategoryRepository categoryRepository;

  GetCategoryUseCase(this.categoryRepository);

  Future<Either<Failures, CategoryModel>> call() =>
      categoryRepository.getCategories();
}
