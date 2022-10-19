import 'package:equatable/equatable.dart';

import 'package:todo_bloc/layers/domain/entities/task_entity.dart';

class TaskDto extends TaskEntity with EquatableMixin {
  final String title;
  final TaskType type;
  final Status status;
  bool? isDeleted;

  TaskDto(
      {required this.title,
      required this.type,
      required this.status,
      this.isDeleted})
      : super(title: title, type: type, status: status, isDeleted: isDeleted);

  @override
  List<Object?> get props => [title, type, status, isDeleted];

  TaskDto copyWith({
    String? title,
    TaskType? type,
    Status? status,
    bool? isDeleted,
  }) {
    return TaskDto(
      title: title ?? this.title,
      type: type ?? this.type,
      status: status ?? this.status,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'type': type,
      'status': status,
      'isDeleted': isDeleted,
    };
  }

  factory TaskDto.fromMap(Map<String, dynamic> map) {
    return TaskDto(
      title: map['title'] ?? '',
      type: map['type'] ?? '',
      status: map['status'] ?? '',
      isDeleted: map['isDeleted'],
    );
  }
}
