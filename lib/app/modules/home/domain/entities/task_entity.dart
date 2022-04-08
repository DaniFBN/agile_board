class TaskEntity {
  const TaskEntity({
    required this.title,
    required this.description,
    required this.completed,
    this.id,
  });

  final String? id;
  final String title;
  final String description;
  final bool completed;
}
