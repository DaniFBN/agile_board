enum RepositoryCollections { task }

extension RepositoryCollectionsName on RepositoryCollections {
  String get name {
    switch (this) {
      case RepositoryCollections.task:
        return 'tasks';
    }
  }
}
