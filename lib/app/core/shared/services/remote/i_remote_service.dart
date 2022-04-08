import 'collections.dart';
import 'helpers/entities.dart';
import 'helpers/params.dart';

abstract class IRemoteService {
  Future<void> add(AddPayload payload);
  Future<List<Map<String, dynamic>>> getAll(RepositoryCollections collection);
  Future<List<Map<String, dynamic>>> getFiltered(
    RepositoryCollections collection,
    Set<RepositoryFilterField> filters,
  );
  Future<void> update(UpdatePayload payload);
  Future<void> remove(RepositoryCollections collection, String docID);
  Future<Map<String, dynamic>> retrieve(
    RepositoryCollections collection,
    String docID,
  );
}
