import 'package:equatable/equatable.dart';

import '../../domain/entities/task_entity.dart';

abstract class TaskState extends Equatable {}

class TaskInitialState extends TaskState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class LoadingState extends TaskState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class SuccessState extends TaskState {

  late final List<TaskEntity> taskData;

  SuccessState({required this.taskData})

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class FailureState extends TaskState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}