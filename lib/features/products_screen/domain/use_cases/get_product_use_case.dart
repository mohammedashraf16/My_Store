import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/products_screen/data/model/product_model.dart';
import 'package:e_commerce/features/products_screen/domain/repository/product_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProductUseCase {
 ProductRepo productRepo;

 GetProductUseCase(this.productRepo);

 Future<Either<Failures, ProductModel>> call(String catId) =>
     productRepo.getProducts(catId);
}