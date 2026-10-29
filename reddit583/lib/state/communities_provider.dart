import 'dart:collection';

import 'package:flutter/foundation.dart';

import '../data/mock_data.dart';
import '../models/community.dart';

class CommunitiesProvider extends ChangeNotifier {
  CommunitiesProvider({List<Community>? initialCommunities})
      : _communities = List.of(initialCommunities ?? mockCommunities);

  final List<Community> _communities;

  UnmodifiableListView<Community> get communities =>
      UnmodifiableListView(_communities);

  /// Adds a community. Returns false when one with the same name exists.
  bool add(String name) {
    final community = Community.fromInput(name);
    if (_communities.contains(community)) return false;
    _communities.add(community);
    notifyListeners();
    return true;
  }

  /// Removes [community] and returns the index it was at, for undo.
  int remove(Community community) {
    final index = _communities.indexOf(community);
    if (index == -1) return -1;
    _communities.removeAt(index);
    notifyListeners();
    return index;
  }

  void restore(Community community, int index) {
    if (_communities.contains(community)) return;
    _communities.insert(index.clamp(0, _communities.length), community);
    notifyListeners();
  }
}
