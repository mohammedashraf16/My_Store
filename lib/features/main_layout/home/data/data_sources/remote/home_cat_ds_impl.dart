import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/main_layout/home/data/data_sources/remote/home_cat_ds.dart';
import 'package:e_commerce/features/main_layout/home/data/model/home_category_model.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:HomeCategoryDS )
class HomeCategoryDSImpl implements HomeCategoryDS {
  @override
  Future<HomeSubCategoryModel> getHomeCategories() async {
    try {
      var response = await getIt<ApiManager>().getData(endpoint: EndPoints.homeCategory);
      HomeSubCategoryModel homeCategoryModel =HomeSubCategoryModel.fromJson(response.data);
      return homeCategoryModel;
    }
    catch (e) {
      throw Failures(e.toString());
    }
  }

}