import 'Post.dart';

class Community {
  List<Post> posts = [];
  String _communityName;
  String _networkURL;
  Community(this._communityName, this._networkURL);
  void setcommunityName(String communityName) {
    _communityName = communityName;
  }
  void setNetworkURL(String networkURL) {
    _networkURL = networkURL;
  }
  String getCommunityName() {
    return _communityName;
  }
  String getNetworkURL() {
    return _networkURL;
  }
  List<Post> getPosts() {
    return posts;
  }
}