part of 'auth_bloc.dart';

 class AuthEvent {}

class LoginEvent extends AuthEvent {
  String email;
  String password;
  LoginEvent(this.email, this.password);
}

class SignupEvent extends AuthEvent {
  SignUpEntity signUpEntity;

  SignupEvent(this.signUpEntity);
}

class ForgetPasswordEvent extends AuthEvent {}

class ShowPassword extends AuthEvent {}
