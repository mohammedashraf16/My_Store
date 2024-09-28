import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/features/main_layout/categories/data/model/sub_category_model.dart';
import 'package:e_commerce/features/main_layout/categories/domain/use_cases/get_sub_cat_use_case.dart';
import 'package:e_commerce/features/main_layout/home/data/model/home_category_model.dart';
import 'package:e_commerce/features/main_layout/home/domain/use_cases/get_home_cat_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'category_event.dart';

part 'category_state.dart';

part 'category_bloc.freezed.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  GetHomeCategoryUseCase getHomeCategoryUseCase;
  GetSubCategoryUseCase getSubCategoryUseCase;

  CategoryBloc(this.getHomeCategoryUseCase,this.getSubCategoryUseCase)
      : super(const CategoryState.initial()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getCategoriesState: RequestState.loading));
      var response = await getHomeCategoryUseCase();
      response.fold(
        (l) {
          emit(state.copyWith(getCategoriesState: RequestState.error));
        },
        (r) {
          emit(state.copyWith(
              getCategoriesState: RequestState.success, homeCategoryModel: r));
          add(GetSubCategoriesEvent(r.data?.first.sId??"Not found"));
        },
      );
    });
    on<GetSubCategoriesEvent>((event, emit) async {
      emit(state.copyWith(getSubCategoriesState: RequestState.loading));
      var response = await getSubCategoryUseCase(event.catId);
      response.fold(
        (l) {
          emit(state.copyWith(getSubCategoriesState: RequestState.error));
        },
        (r) {
          emit(state.copyWith(
              getSubCategoriesState: RequestState.success,categoryModel: r));
        },
      );
    });
  }
}
