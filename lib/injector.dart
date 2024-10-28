import 'package:get_it/get_it.dart';
import 'package:rapid_chain/config/data/authentication_manager.dart';
import 'package:rapid_chain/config/data/remote_manager.dart';
import 'package:rapid_chain/config/data/shared_manager.dart';
import 'package:rapid_chain/data/repository/auth/auth_repository_impl.dart';
import 'package:rapid_chain/data/repository/task/task_repository_impl.dart';
import 'package:rapid_chain/data/repository/util/util_repository_impl.dart';
import 'package:rapid_chain/data/source/remote/auth_remote_data_source.dart';
import 'package:rapid_chain/data/source/remote/task_remote_data_source.dart';
import 'package:rapid_chain/data/source/remote/util_remote_data_source.dart';
import 'package:rapid_chain/domain/repository/auth/auth_repository.dart';
import 'package:rapid_chain/domain/repository/task/task_repository.dart';
import 'package:rapid_chain/domain/repository/util/util_repository.dart';
import 'package:rapid_chain/domain/usecase/auth/auth_usecase.dart';
import 'package:rapid_chain/domain/usecase/task/task_usecase.dart';
import 'package:rapid_chain/domain/usecase/util/util_usecase.dart';
import 'package:rapid_chain/util/resources/authentication_source.dart';

final locator = GetIt.instance;
void init() {
  locator.registerLazySingleton(() => AuthenticationSource());
  locator.registerLazySingleton(() => AuthenticationManager());
  locator.registerLazySingleton(() => RemoteManager());
  locator.registerLazySingleton(() => SharedManager());

  /* USECASE PART */
  locator.registerLazySingleton(() => AuthUseCase());
  locator.registerLazySingleton(() => UtilUseCase());
  locator.registerLazySingleton(() => TaskUseCase());

  /* REPOSITORY PART */
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  locator.registerLazySingleton<UtilRepository>(() => UtilRepositoryImpl());
  locator.registerLazySingleton<TaskRepository>(() => TaskRepositoryImpl());

  /* REMOTE DATA SOURCE PART */
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl());
  locator.registerLazySingleton<UtilRemoteDataSource>(
      () => UtilRemoteDataSourceImpl());
  locator.registerLazySingleton<TaskRemoteDataSource>(
      () => TaskRemoteDataSourceImpl());
}
