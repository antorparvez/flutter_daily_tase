
import 'package:get_it/get_it.dart';
import 'package:my_daily_tase/features/data/local_data_source/local_data_scource.dart';
import 'package:my_daily_tase/features/data/local_data_source/local_data_source_impl.dart';
import 'package:my_daily_tase/features/data/repositories/local_data_repository_imp.dart';
import 'package:my_daily_tase/features/domain/repositories/local_repository.dart';
import 'package:my_daily_tase/features/domain/usecases/get_task_notification_usecase.dart';
import 'package:my_daily_tase/features/domain/usecases/off_tase_notification_usecase.dart';
import 'package:my_daily_tase/features/domain/usecases/open_local_db_usecase.dart';
import 'package:my_daily_tase/features/domain/usecases/update_tase_usecase.dart';
import 'package:my_daily_tase/features/presentation/cubit/task_cubit.dart';

import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/get_all_tase_usecase.dart';

GetIt sl = GetIt.instance;

Future<void> initDI() async {
  //bloc/Cubit
  sl.registerFactory<TaskCubit>(() => TaskCubit(
        getTaskNotificationUseCase: sl.call(),
        deleteTaskUseCase: sl.call(),
        addTaskUseCase: sl.call(),
        getAllTaskUseCase: sl.call(),
        openDatabaseUseCase: sl.call(),
        onOffTaskNotificationUseCase: sl.call(),
        updateTaskUseCase: sl.call(),
      ));

  //UseCases
  sl.registerLazySingleton<AddTaskUseCase>(
      () => AddTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<DeleteTaskUseCase>(
      () => DeleteTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetAllTaskUseCase>(
      () => GetAllTaskUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<GetTaskNotificationUseCase>(
      () => GetTaskNotificationUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<OpenDatabaseUseCase>(
      () => OpenDatabaseUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<OffTaskNotificationUseCase>(
      () => OffTaskNotificationUseCase(localRepository: sl.call()));
  sl.registerLazySingleton<UpdateTaskUseCase>(
      () => UpdateTaskUseCase(localRepository: sl.call()));

  //Repository
  sl.registerLazySingleton<LocalRepository>(
      () => LocalDataRepositoryImp(localDataSource: sl.call()));

  //RemoteDataSource
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
}
