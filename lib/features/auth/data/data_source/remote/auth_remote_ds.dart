import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/entity/sign_up_entity.dart';

abstract class AuthRemoteDs{
  Future<bool> signIn(String email, String password);
  Future<UserModel> signUp(SignUpEntity signUpEntity);
}