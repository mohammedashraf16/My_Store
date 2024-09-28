import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/main_layout/categories/data/data_sources/remote/cat_remote_ds.dart';
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CategoryDS)
class CategoryDSImpl implements CategoryDS {
  @override
  Future<SubCategoryModel> getSubCategories(String catId) async {
    var response = await getIt<ApiManager>()
        .getData(endpoint: "${EndPoints.homeCategory}/$catId/subcategories",);

    SubCategoryModel subCatModel = SubCategoryModel.fromJson(response.data);
    return subCatModel;
  }
}