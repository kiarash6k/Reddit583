enum VoteState { none, up, down }

class Post {
  const Post({
    required this.id,
    required this.communityName,
    required this.author,
    required this.title,
    required this.body,
    this.baseVotes = 0,
    this.vote = VoteState.none,
    this.isSaved = false,
  });

  final String id;
  final String communityName;
  final String author;
  final String title;
  final String body;

  /// Votes cast by other users, before the current user's own vote.
  final int baseVotes;
  final VoteState vote;
  final bool isSaved;

  int get votes =>
      baseVotes +
      switch (vote) {
        VoteState.up => 1,
        VoteState.down => -1,
        VoteState.none => 0,
      };

  Post copyWith({VoteState? vote, bool? isSaved}) {
    return Post(
      id: id,
      communityName: communityName,
      author: author,
      title: title,
      body: body,
      baseVotes: baseVotes,
      vote: vote ?? this.vote,
      isSaved: isSaved ?? this.isSaved,
    );
  }
}
