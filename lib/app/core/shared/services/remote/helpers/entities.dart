enum FilterType { equal, contains }

class RepositoryFilterField {
  const RepositoryFilterField({
    required this.key,
    required this.value,
    required this.filterType,
  });

  final FilterType filterType;
  final String key;
  final dynamic value;
}
