import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/categories/data/data_sources/remote/cat_remote_ds.dart';
import 'package:e_commerce/features/main_layout/categories/data/models/category_model.dart';

class CategoryRemoteDSImpl implements CategoryRemoteDS{
  ApiManager apiManager;
  CategoryRemoteDSImpl(this.apiManager);

  @override
  Future<CategoryModel> getCategory() async{
    try{
      var response = await apiManager.getData(endpoint: EndPoints.subCategories);
      CategoryModel categoryModel = CategoryModel.fromJson(response.data);
      return categoryModel;
    }catch(e){
      throw Failures(e.toString());
    }
  }


}