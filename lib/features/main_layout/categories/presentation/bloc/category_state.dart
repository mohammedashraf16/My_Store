part of 'category_bloc.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.initial({
    @Default(RequestState.init)RequestState getCategoriesState,
    @Default(RequestState.init)RequestState getSubCategoriesState,
    HomeSubCategoryModel? homeCategoryModel,
    SubCategoryModel? categoryModel,
    String? errorMessage,
    
}) = _Initial;
}
