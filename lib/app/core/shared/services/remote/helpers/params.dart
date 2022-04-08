import '../collections.dart';

class AddPayload {
  const AddPayload({required this.collection, required this.data});

  final RepositoryCollections collection;
  final Map<String, dynamic> data;
}

class UpdatePayload {
  const UpdatePayload({
    required this.collection,
    required this.documentID,
    required this.data,
  });

  final RepositoryCollections collection;
  final String documentID;
  final Map<String, dynamic> data;
}
