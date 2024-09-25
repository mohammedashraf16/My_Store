import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/data/data_sources/remote/cat_remote_ds.dart';
import 'package:e_commerce/features/main_layout/categories/data/models/category_model.dart';
import 'package:e_commerce/features/main_layout/categories/domain/repository/category_repository.dart';

class CategoryImpl implements CategoryRepository {
  CategoryRemoteDS categoryRemoteDS;

  CategoryImpl(this.categoryRemoteDS);

  @override
  Future<Either<Failures, CategoryModel>> getCategories() async {
    try {
      var categoryModel = await categoryRemoteDS.getCategory();
      return Right(categoryModel);
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}
