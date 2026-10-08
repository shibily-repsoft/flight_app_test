// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:flight_app_test/core/utlis/api_call_helper.dart' as _i736;
import 'package:flight_app_test/core/utlis/connectvity_helper.dart' as _i156;
import 'package:flight_app_test/features/flight_list/data/data_source/flights_remote_ds.dart'
    as _i169;
import 'package:flight_app_test/features/flight_list/data/data_source/flights_remote_ds_impl.dart'
    as _i1003;
import 'package:flight_app_test/features/flight_list/data/repository/flights_repo.dart'
    as _i114;
import 'package:flight_app_test/features/flight_list/data/repository/flights_repo_impl.dart'
    as _i829;
import 'package:flight_app_test/features/flight_list/presentation/cubits/flights_cubit.dart'
    as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i156.ConnectivityCheckerHelper>(
      () => _i156.ConnectivityCheckerHelper(),
    );
    gh.factory<_i361.FlightsCubit>(
      () => _i361.FlightsCubit(gh<_i114.FlightsRepository>()),
    );
    gh.factory<_i736.ApiCallHelper>(
      () => _i736.ApiCallHelper(gh<_i156.ConnectivityCheckerHelper>()),
    );
    gh.factory<_i169.FlightsRemoteDataSource>(
      () => _i1003.FlightsRemoteDataSourceImpl(gh<_i736.ApiCallHelper>()),
    );
    gh.lazySingleton<_i114.FlightsRepository>(
      () => _i829.FlightsRepositoryImpl(gh<_i169.FlightsRemoteDataSource>()),
    );
    return this;
  }
}
