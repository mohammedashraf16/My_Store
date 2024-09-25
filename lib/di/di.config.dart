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
    gh.factory<_i1056.HomeRepository>(
        () => _i1024.HomeCategoryImpl(gh<_i885.HomeCategoryDS>()));
    gh.factory<_i393.GetHomeCategoryUseCase>(
        () => _i393.GetHomeCategoryUseCase(gh<_i1056.HomeRepository>()));
    gh.factory<_i103.HomeCategoryBloc>(
        () => _i103.HomeCategoryBloc(gh<_i393.GetHomeCategoryUseCase>()));
    return this;
  }
}
