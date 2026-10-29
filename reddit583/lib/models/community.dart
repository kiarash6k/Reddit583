class Community {
  const Community(this.name);

  /// Display name including the `r/` prefix, e.g. `r/Valorant`.
  final String name;

  /// Builds a community from user input, normalising the `r/` prefix.
  factory Community.fromInput(String input) {
    final trimmed =
        input.trim().replaceFirst(RegExp(r'^r/', caseSensitive: false), '');
    return Community('r/$trimmed');
  }

  @override
  bool operator ==(Object other) =>
      other is Community && other.name.toLowerCase() == name.toLowerCase();

  @override
  int get hashCode => name.toLowerCase().hashCode;
}
