import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/home/data/data_sources/remote/home_cat_ds.dart';
import 'package:e_commerce/features/main_layout/home/data/model/home_category_model.dart';
import 'package:e_commerce/features/main_layout/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepository)
class HomeCategoryImpl implements HomeRepository {
  HomeCategoryDS homeCategoryDS;

  HomeCategoryImpl(this.homeCategoryDS);

  @override
  Future<Either<Failures, HomeSubCategoryModel>> getCategories()async {
    try{
    var homeCategoryModel= await  homeCategoryDS.getHomeCategories();
    return Right(homeCategoryModel);
    }
        catch(e){
      return Left(Failures(e.toString()));
        }
  }
}
