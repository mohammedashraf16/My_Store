import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/features/main_layout/home/data/model/home_cat_model.dart';
import 'package:e_commerce/features/main_layout/home/domain/use_cases/get_home_cat_use_case.dart';
import 'package:injectable/injectable.dart';

part 'home_category_event.dart';

part 'home_category_state.dart';
@injectable
class HomeCategoryBloc extends Bloc<HomeCategoryEvent, HomeCategoryState> {
  GetHomeCategoryUseCase getHomeCategoryUseCase;

  HomeCategoryBloc(this.getHomeCategoryUseCase) : super(HomeCategoryInitial()) {
    on<GetHomeCategoryEvent>((event, emit) async {
      var data = await getHomeCategoryUseCase.call();
      data.fold(
        (l) {
          emit(state.copyWith(
            requestState: RequestState.error,
            errorMessage: l.errorMessage,
          ));
        },
        (r) {
          emit(state.copyWith(
            requestState: RequestState.success,
            homeCategoryModel: r,
          ));
        },
      );
    });
  }
}
