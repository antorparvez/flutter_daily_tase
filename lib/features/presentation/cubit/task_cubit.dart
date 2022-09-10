import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_daily_tase/features/domain/entities/task_entity.dart';
import 'package:my_daily_tase/features/domain/usecases/delete_task_usecase.dart';
import 'package:my_daily_tase/features/presentation/cubit/task_state.dart';

import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/get_all_tase_usecase.dart';
import '../../domain/usecases/get_task_notification_usecase.dart';
import '../../domain/usecases/off_tase_notification_usecase.dart';
import '../../domain/usecases/open_local_db_usecase.dart';
import '../../domain/usecases/update_tase_usecase.dart';

class TaskCubit extends Cubit<TaskState> {
  final AddTaskUseCase addTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final GetAllTaskUseCase getAllTaskUseCase;
  final GetTaskNotificationUseCase getTaskNotificationUseCase;
  final OffTaskNotificationUseCase onOffTaskNotificationUseCase;
  final OpenDatabaseUseCase openDatabaseUseCase;
  final UpdateTaskUseCase updateTaskUseCase;

  TaskCubit(
      this.addTaskUseCase,
      this.deleteTaskUseCase,
      this.getAllTaskUseCase,
      this.getTaskNotificationUseCase,
      this.onOffTaskNotificationUseCase,
      this.openDatabaseUseCase,
      this.updateTaskUseCase)
      : super(TaskInitialState());

  Future<void> addNewTaskCubit({required TaskEntity taskEntity}) async {
    try {
      await addTaskUseCase.call(taskEntity);
      //addTaskUseCase(taskEntity);//both same
    } catch (_) {
      emit(FailureState());
    }
  }

  Future<void> deleteTaskCubit({required TaskEntity taskEntity}) async {
    try {
      await deleteTaskUseCase.call(taskEntity);
    } catch (_) {
      emit(FailureState());
    }
  }

  Future<void> getAllTaskCubit({required TaskEntity taskEntity}) async {
    try {
      final taskList = await getAllTaskUseCase.call();
      emit(SuccessState(taskData: taskList));
    } catch (_) {
      emit(FailureState());
    }
  }

  Future<void> openDatabaseCubit({required TaskEntity taskEntity}) async {
    try {
      await openDatabaseUseCase.call();
    } catch (_) {
      emit(FailureState());
    }
  }

  Future<void> getNotificationTaskCubit(
      {required TaskEntity taskEntity}) async {
    try {
      await getTaskNotificationUseCase.call(taskEntity);
    } catch (_) {
      emit(FailureState());
    }
  }

  Future<void> turnOnOffNotificationTaskCubit(
      {required TaskEntity taskEntity}) async {
    try {
      await onOffTaskNotificationUseCase.call(taskEntity);
    } catch (_) {
      emit(FailureState());
    }
  }

  Future<void> updateTaskCubit({required TaskEntity taskEntity}) async {
    try {
      await updateTaskUseCase.call(taskEntity);
    } catch (_) {
      emit(FailureState());
    }
  }
}
