import 'package:flutter_test/flutter_test.dart';
import 'package:reddit583/models/community.dart';
import 'package:reddit583/state/communities_provider.dart';

void main() {
  late CommunitiesProvider provider;

  setUp(() => provider =
      CommunitiesProvider(initialCommunities: [const Community('r/Dart')]));

  test('add normalises the r/ prefix', () {
    expect(provider.add('Flutter'), isTrue);
    expect(provider.add('r/Rust'), isTrue);
    expect(provider.communities.map((c) => c.name),
        ['r/Dart', 'r/Flutter', 'r/Rust']);
  });

  test('duplicates are rejected case-insensitively', () {
    expect(provider.add('dart'), isFalse);
    expect(provider.add('R/DART'), isFalse);
    expect(provider.communities.length, 1);
  });

  test('remove and restore bring the community back at the same index', () {
    provider.add('Flutter');
    final dart = provider.communities.first;
    final index = provider.remove(dart);
    expect(index, 0);
    expect(provider.communities.length, 1);
    provider.restore(dart, index);
    expect(provider.communities.first, dart);
  });
}
