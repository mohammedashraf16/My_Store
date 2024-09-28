import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/main_layout/categories/data/data_sources/remote/cat_remote_ds.dart';
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';
import 'package:e_commerce/features/products_screen/data/data_sources/remote/product_remote_ds.dart';
import 'package:e_commerce/features/products_screen/data/model/product_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRemoteDs)
class ProductRemoteDsImpl implements ProductRemoteDs {
  @override
  Future<ProductModel> getProducts(String catId) async {
    var response = await getIt<ApiManager>()
        .getData(endpoint:EndPoints.products,parameters: {
          "category[in]":catId
    });

    ProductModel productModel = ProductModel.fromJson(response.data);
    return productModel;
  }
}