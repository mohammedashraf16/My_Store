import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/data/data_sources/remote/cat_remote_ds.dart';
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';
import 'package:e_commerce/features/main_layout/categories/domain/repository/category_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryRepo)
class CategoryRepoImpl implements CategoryRepo {
  CategoryDS categoryDS;

  CategoryRepoImpl(this.categoryDS);

  @override
  Future<Either<Failures, SubCategoryModel>> getSubCategories(
      String catId) async {
    try {
      var data = await categoryDS.getSubCategories(catId);
      return Right(data);
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}
