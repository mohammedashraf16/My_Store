import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/auth/data/model/user_model.dart';
import 'package:e_commerce/features/auth/domain/entity/sign_up_entity.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repo.dart';

class SignUpUseCase {
  AuthRepo authRepo;

  SignUpUseCase( this.authRepo);

  Future<Either<Failures,UserModel>> call(SignUpEntity signUpEntity) =>
      authRepo.signUp(signUpEntity  );
}
