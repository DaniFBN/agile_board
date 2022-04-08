import '../../../../core/shared/interfaces/notifier_store.dart';
import '../../../../core/shared/services/remote/collections.dart';
import '../../../../core/shared/services/remote/helpers/params.dart';
import '../../../../core/shared/services/remote/i_remote_service.dart';
import '../../domain/entities/task_entity.dart';
import '../../infra/mappers/task_mapper.dart';

class TaskStore extends IBoardNotifierStore<Set<TaskEntity>> {
  TaskStore(this._remoteService) : super({});

  final IRemoteService _remoteService;

  Future<void> loadTasks() async {
    setLoading(true);

    // final response = await FirebaseFirestore.instance.collection('tasks').get();
    // final tasks = response.docs.map((e) {
    //   final data = <String, dynamic>{
    //     'id': e.id,
    //     ...e.data(),
    //   };
    //   return TaskMapper.fromMap(data);
    // });

    final response = await _remoteService.getAll(RepositoryCollections.task);
    final tasks = response.map(TaskMapper.fromMap);

    update(tasks.toSet());

    setLoading(false);
  }

  Future<void> deleteTask(TaskEntity task) async {
    await _remoteService.remove(RepositoryCollections.task, task.id!);

    await loadTasks();
  }

  Future<void> setCompleteTask(TaskEntity task) async {
    final data = {'completed': !task.completed};

    final param = UpdatePayload(
      data: data,
      collection: RepositoryCollections.task,
      documentID: task.id!,
    );
    await _remoteService.update(param);
    // await FirebaseFirestore.instance.collection('tasks').doc(task.id).update(
    //       data,
    //     );

    await loadTasks();
  }

  Future<void> addTask({
    required String title,
    required String description,
  }) async {
    setLoading(true);

    final task = TaskEntity(
      title: title,
      description: description,
      completed: false,
    );
    final data = TaskMapper.toMap(task);

    final param = AddPayload(
      collection: RepositoryCollections.task,
      data: data,
    );
    await _remoteService.add(param);

    // await FirebaseFirestore.instance.collection('tasks').add(data);

    await loadTasks();
    setLoading(false);
  }
}
