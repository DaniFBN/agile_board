import '../../domain/entities/task_entity.dart';

class TaskMapper {
  static TaskEntity fromMap(Map<String, dynamic> data) {
    return TaskEntity(
      id: data['id'] as String,
      title: data['title'] as String,
      description: data['description'] as String,
      completed: data['completed'] as bool,
    );
  }

  static Map<String, dynamic> toMap(TaskEntity task) {
    return <String, dynamic>{
      'title': task.title,
      'description': task.description,
      'completed': task.completed,
    };
  }
}
