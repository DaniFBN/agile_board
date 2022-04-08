import 'package:cloud_firestore/cloud_firestore.dart';

import '../../failures/exceptions.dart';
import 'collections.dart';
import 'helpers/entities.dart';
import 'helpers/params.dart';
import 'helpers/responses.dart';
import 'i_remote_service.dart';

class FirestoreRemoteService implements IRemoteService {
  const FirestoreRemoteService(this._firestore);

  final FirebaseFirestore _firestore;

  @override
  Future<AddResponse> add(AddPayload payload) async {
    final collectionRef = _getCollection(payload.collection);
    final response = await collectionRef.add(payload.data);

    final doc = await response.get();

    return AddResponse(code: doc.id);
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(
    RepositoryCollections collection,
  ) async {
    final collectionRef = _getCollection(collection);
    final response = await collectionRef.get();

    final data = response.docs.map(_documentSnapshotToMap).toList();

    return data;
  }

  @override
  Future<List<Map<String, dynamic>>> getFiltered(
    RepositoryCollections collection,
    Set<RepositoryFilterField> filters,
  ) async {
    final collectionRef = _getCollection(collection);

    Query query = collectionRef;
    for (final filter in filters) {
      query = _handleFilter(query, filter);
    }

    final response = await query.get();

    final data = response.docs.map(_documentSnapshotToMap).toList();

    return data;
  }

  Query _handleFilter(Query query, RepositoryFilterField filter) {
    if (filter.filterType == FilterType.equal) {
      return query.where(filter.key, isEqualTo: filter.value);
    } else {
      return query.where(filter.key, arrayContains: filter.value);
    }
  }

  Map<String, dynamic> _documentSnapshotToMap(DocumentSnapshot snapshot) {
    final response = <String, dynamic>{
      'id': snapshot.id,
      ...Map<String, dynamic>.from(snapshot.data()! as Map),
    };

    return response;
  }

  @override
  Future<void> update(UpdatePayload payload) async {
    final documentRef = _getDocument(payload.collection, payload.documentID);

    try {
      await documentRef.update(payload.data);
    } on FirebaseException catch (err, stackTrace) {
      throw FailedUpdateException(
        message: 'Erro ao atualizar',
        stackTrace: stackTrace,
      );
    }
  }

  DocumentReference _getDocument(RepositoryCollections collection, String doc) {
    return _getCollection(collection).doc(doc);
  }

  CollectionReference _getCollection(RepositoryCollections collection) {
    return _firestore.collection(collection.name);
  }

  @override
  Future<void> remove(RepositoryCollections collection, String docID) async {
    await _getDocument(collection, docID).delete();
  }

  @override
  Future<Map<String, dynamic>> retrieve(
    RepositoryCollections collection,
    String docID,
  ) async {
    final doc = await _getDocument(collection, docID).get();

    final data = _documentSnapshotToMap(doc);

    return data;
  }
}
