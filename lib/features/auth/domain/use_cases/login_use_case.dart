import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/auth/domain/repository/auth_repo.dart';

class LoginUseCase {
  AuthRepo authRepo;

  LoginUseCase( this.authRepo);

  Future<Either<Failures,bool>> call(String email, String password) =>
      authRepo.signIn(email, password);
}
