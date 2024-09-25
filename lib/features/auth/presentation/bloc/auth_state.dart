part of 'auth_bloc.dart';


class AuthLoginState {
  RequestState? requestState;
  bool? loggedIn;
  String? errorMessage;
  AuthLoginState({this.requestState, this.loggedIn, this.errorMessage});

  AuthLoginState copyWith(
      {RequestState? requestState, bool? loggedIn, String? errorMessage}) {
    return AuthLoginState(
        requestState: requestState ?? this.requestState,
        loggedIn: loggedIn ?? this.loggedIn,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

class AuthLoginInit extends AuthLoginState {
  AuthLoginInit()
      : super(
      requestState: RequestState.init, loggedIn: false, errorMessage: "");
}
