// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/api/api_manager.dart' as _i108;
import '../features/main_layout/categories/data/data_sources/remote/cat_remote_ds.dart'
    as _i802;
import '../features/main_layout/categories/data/data_sources/remote/cat_remote_ds_impl.dart'
    as _i132;
import '../features/main_layout/categories/data/repository/category_impl.dart'
    as _i917;
import '../features/main_layout/categories/domain/repository/category_repository.dart'
    as _i250;
import '../features/main_layout/categories/domain/use_cases/get_sub_cat_use_case.dart'
    as _i34;
import '../features/main_layout/categories/presentation/bloc/category_bloc.dart'
    as _i570;
import '../features/main_layout/home/data/data_sources/remote/home_cat_ds.dart'
    as _i885;
import '../features/main_layout/home/data/data_sources/remote/home_cat_ds_impl.dart'
    as _i638;
import '../features/main_layout/home/data/repositories/home_cat_impl.dart'
    as _i1024;
import '../features/main_layout/home/domain/repositories/home_repo.dart'
    as _i1056;
import '../features/main_layout/home/domain/use_cases/get_home_cat_use_case.dart'
    as _i393;
import '../features/main_layout/home/presentation/bloc/home_category_bloc.dart'
    as _i103;
import '../features/products_screen/data/data_sources/remote/product_remote_ds.dart'
    as _i343;
import '../features/products_screen/data/data_sources/remote/product_remote_ds_impl.dart'
    as _i1054;
import '../features/products_screen/data/repository/product_repo_impl.dart'
    as _i921;
import '../features/products_screen/domain/repository/product_repo.dart'
    as _i681;
import '../features/products_screen/domain/use_cases/get_product_use_case.dart'
    as _i924;
import '../features/products_screen/presentation/bloc/product_bloc.dart'
    as _i28;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i108.ApiManager>(() => _i108.ApiManager());
    gh.factory<_i885.HomeCategoryDS>(() => _i638.HomeCategoryDSImpl());
    gh.factory<_i343.ProductRemoteDs>(() => _i1054.ProductRemoteDsImpl());
    gh.factory<_i802.CategoryDS>(() => _i132.CategoryDSImpl());
    gh.factory<_i250.CategoryRepo>(
        () => _i917.CategoryRepoImpl(gh<_i802.CategoryDS>()));
    gh.factory<_i1056.HomeRepository>(
        () => _i1024.HomeCategoryImpl(gh<_i885.HomeCategoryDS>()));
    gh.factory<_i681.ProductRepo>(
        () => _i921.ProductRepoImpl(gh<_i343.ProductRemoteDs>()));
    gh.factory<_i393.GetHomeCategoryUseCase>(
        () => _i393.GetHomeCategoryUseCase(gh<_i1056.HomeRepository>()));
    gh.factory<_i103.HomeCategoryBloc>(
        () => _i103.HomeCategoryBloc(gh<_i393.GetHomeCategoryUseCase>()));
    gh.factory<_i34.GetSubCategoryUseCase>(
        () => _i34.GetSubCategoryUseCase(gh<_i250.CategoryRepo>()));
    gh.factory<_i924.GetProductUseCase>(
        () => _i924.GetProductUseCase(gh<_i681.ProductRepo>()));
    gh.factory<_i570.CategoryBloc>(() => _i570.CategoryBloc(
          gh<_i393.GetHomeCategoryUseCase>(),
          gh<_i34.GetSubCategoryUseCase>(),
        ));
    gh.factory<_i28.ProductBloc>(
        () => _i28.ProductBloc(gh<_i924.GetProductUseCase>()));
    return this;
  }
}
