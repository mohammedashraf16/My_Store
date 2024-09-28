
import 'package:e_commerce/features/products_screen/data/model/product_model.dart';

abstract class ProductRemoteDs {
  Future<ProductModel> getProducts(String catId);
}