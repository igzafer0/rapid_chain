import 'package:get_it/get_it.dart';
import 'package:rapid_chain/config/data/authentication_manager.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/data/repository/auth/auth_repository_impl.dart';
import 'package:rapid_chain/data/source/remote/auth_remote_data_source.dart';
import 'package:rapid_chain/domain/repository/auth/auth_repository.dart';
import 'package:rapid_chain/domain/usecase/auth/auth_usecase.dart';
import 'package:rapid_chain/util/resources/authentication_source.dart';

final locator = GetIt.instance;
void init() {
  locator.registerLazySingleton(() => AuthenticationSource());
  locator.registerLazySingleton(() => AuthenticationManager());
  locator.registerLazySingleton(() => RemoteManager());

  /* USECASE PART */
  locator.registerLazySingleton(() => AuthUseCase());

  /* REPOSITORY PART */
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

  /* REMOTE DATA SOURCE PART */
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
}
