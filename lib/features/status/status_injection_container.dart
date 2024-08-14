import '../../main_injection_container.dart';
import 'data/remote/status_remote_data_source.dart';
import 'data/remote/status_remote_data_source_impl.dart';
import 'data/repository/status_repository_impl.dart';
import 'domain/repository/status_repository.dart';
import 'domain/usecases/create_status_usecase.dart';
import 'domain/usecases/delete_status_usecase.dart';
import 'domain/usecases/get_my_status_future_usecase.dart';
import 'domain/usecases/get_my_status_usecase.dart';
import 'domain/usecases/get_statuses_usecase.dart';
import 'domain/usecases/seen_status_update_usecase.dart';
import 'domain/usecases/update_only_image_status_usecase.dart';
import 'domain/usecases/update_status_usecase.dart';
import 'presentation/cubit/get_my_status/get_my_status_cubit.dart';
import 'presentation/cubit/status/status_cubit.dart';

Future<void> statusInjectionContainer() async {

  // * CUBITS INJECTION

  sl.registerFactory<StatusCubit>(() => StatusCubit(
      createStatusUseCase: sl.call(),
      deleteStatusUseCase: sl.call(),
      getStatusesUseCase: sl.call(),
      updateStatusUseCase: sl.call(),
      updateOnlyImageStatusUseCase: sl.call(),
      seenStatusUpdateUseCase: sl.call()
  ));

  sl.registerFactory<GetMyStatusCubit>(() => GetMyStatusCubit(
    getMyStatusUseCase: sl.call(),
  ));

  // * USE CASES INJECTION

  sl.registerLazySingleton<GetMyStatusUseCase>(
          () => GetMyStatusUseCase(repository: sl.call()));

  sl.registerLazySingleton<UpdateOnlyImageStatusUseCase>(
          () => UpdateOnlyImageStatusUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetMyStatusFutureUseCase>(
          () => GetMyStatusFutureUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetStatusesUseCase>(
          () => GetStatusesUseCase(repository: sl.call()));

  sl.registerLazySingleton<DeleteStatusUseCase>(
          () => DeleteStatusUseCase(repository: sl.call()));

  sl.registerLazySingleton<UpdateStatusUseCase>(
          () => UpdateStatusUseCase(repository: sl.call()));

  sl.registerLazySingleton<CreateStatusUseCase>(
          () => CreateStatusUseCase(repository: sl.call()));

  sl.registerLazySingleton<SeenStatusUpdateUseCase>(
          () => SeenStatusUpdateUseCase(repository: sl.call()));

  // * REPOSITORY & DATA SOURCES INJECTION

  sl.registerLazySingleton<StatusRepository>(
          () => StatusRepositoryImpl(remoteDataSource: sl.call()));

  sl.registerLazySingleton<StatusRemoteDataSource>(() => StatusRemoteDataSourceImpl(
    fireStore: sl.call(),
  ));
}