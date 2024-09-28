import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/enums.dart';
import 'package:e_commerce/features/products_screen/data/model/product_model.dart';
import 'package:e_commerce/features/products_screen/domain/use_cases/get_product_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';
@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  GetProductUseCase getProductUseCase;
  ProductBloc(this.getProductUseCase) : super(const ProductState.initial()) {
    on<GetProductsEvent>((event, emit) async{
      emit(state.copyWith(getProductsState: RequestState.loading));
      var response = await getProductUseCase(event.catId);
      response.fold(
            (l) {
          emit(state.copyWith(getProductsState: RequestState.error));
        },
            (r) {
          emit(state.copyWith(
              getProductsState: RequestState.success,productModel: r));
        },
      );
    });
  }
}
