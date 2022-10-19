import 'package:equatable/equatable.dart';

enum TaskType { work, personal, fun }

enum Status { done, toDo, doing }

class TaskEntity extends Equatable {
  final String title;
  final TaskType type;
  final Status status;
  bool? isDeleted;

  TaskEntity({
    required this.title,
    required this.type,
    required this.status,
    this.isDeleted,
  }) {
    isDeleted = isDeleted ?? false;
  }

  @override
  List<Object?> get props => [
        title,
        type,
        status,
        isDeleted,
      ];

  TaskEntity copyWith({
    String? title,
    TaskType? type,
    Status? status,
    bool? isDeleted,
  }) {
    return TaskEntity(
      title: title ?? this.title,
      type: type ?? this.type,
      status: status ?? this.status,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }
}
