import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/auth/data/data_source/remote/auth_remote_ds.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/entity/sign_up_entity.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRemoteDs authRemoteDs;

  AuthRepoImpl( this.authRemoteDs);

  @override
  Future<Either<Failures,bool>> signIn(String email, String password) async{
    try{
      bool loggedIn =await authRemoteDs.signIn(email, password);
      if(!loggedIn){
        return Left(ClientError("Invalid email or password"));
      }
      return Right(loggedIn);
    }catch(e){
      return Left(Failures(e.toString()));
    }
  }

  @override
  Future<Either<Failures,UserModel>> signUp(SignUpEntity signUpEntity) async{
    try{
     var userModel=await  authRemoteDs.signUp(signUpEntity);
      return Right(userModel);

    }catch(e){
      return Left(Failures(e.toString()));
    }
  }
}
