import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/domain/repository/category_repository.dart';
import 'package:e_commerce/features/products_screen/data/data_sources/remote/product_remote_ds.dart';
import 'package:e_commerce/features/products_screen/data/model/product_model.dart';
import 'package:e_commerce/features/products_screen/domain/repository/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  ProductRemoteDs productRemoteDs;

  ProductRepoImpl(this.productRemoteDs);

  @override
  Future<Either<Failures, ProductModel>> getProducts(
      String catId) async {
    try {
      var data = await productRemoteDs.getProducts(catId);
      return Right(data);
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}
