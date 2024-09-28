import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/products_screen/data/model/product_model.dart';

abstract class ProductRepo{


  Future<Either<Failures,ProductModel>> getProducts(String catId);
}