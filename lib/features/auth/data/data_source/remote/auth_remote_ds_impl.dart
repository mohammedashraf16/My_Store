import 'package:e_commerce/core/api/api_manager.dart';
import 'package:e_commerce/core/api/end_points.dart';
import 'package:e_commerce/core/api/status_codes.dart';
import 'package:e_commerce/core/cache/shared_pref.dart';
import 'package:e_commerce/core/exceptions/exceptions.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/entity/sign_up_entity.dart';

class AuthRemoteDsImpl implements AuthRemoteDs{
  ApiManager apiManager;
  AuthRemoteDsImpl(this.apiManager);
  @override
  Future<bool> signIn(String email, String password) async{
    try{
      final response = await apiManager.postData(endpoint: EndPoints.signIn,body: {
        'email': email,
        'password': password,
      });

      if(response.statusCode==StatusCodes.success){
        await CacheHelper.setData<String>("token", response.data["token"]);
        return true;
      }else{
        return false;
      }
    }catch(e){
      throw RouteRemoteException(e.toString());
    }
  }

  @override
  Future<UserModel> signUp(SignUpEntity signUpEntity) async{
    try{
      var response = await apiManager.postData(endpoint: EndPoints.signUp,body: signUpEntity.toJson());
      print(response.statusCode);
      print(response);
     UserModel userModel = UserModel.fromJson(response.data);
     return userModel;
    }catch(e){
      throw RouteRemoteException(e.toString());
    }
  }

}