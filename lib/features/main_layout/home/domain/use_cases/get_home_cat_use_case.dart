import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/exceptions/failuers.dart';
import 'package:e_commerce/features/main_layout/home/data/model/home_cat_model.dart';
import 'package:e_commerce/features/main_layout/home/domain/repositories/home_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
 class GetHomeCategoryUseCase{
  HomeRepository homeRepository;
  GetHomeCategoryUseCase(this.homeRepository);

  Future<Either<Failures,HomeCategoryModel>>call()=> homeRepository.getCategories();
}