part of 'home_category_bloc.dart';

class HomeCategoryState {
  RequestState? requestState;
  HomeCategoryModel? homeCategoryModel;
  String? errorMessage;

  HomeCategoryState(
      {this.requestState, this.homeCategoryModel, this.errorMessage});

  HomeCategoryState copyWith(
      {RequestState? requestState,
      HomeCategoryModel? homeCategoryModel,
      String? errorMessage}) {
    return HomeCategoryState(
        requestState: requestState ?? this.requestState,
        homeCategoryModel: homeCategoryModel ?? this.homeCategoryModel,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}

final class HomeCategoryInitial extends HomeCategoryState {
  HomeCategoryInitial()
      : super(
            requestState: RequestState.init,
            homeCategoryModel: null,
            errorMessage: "");
}
