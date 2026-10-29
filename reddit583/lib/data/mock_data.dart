import '../models/community.dart';
import '../models/post.dart';
import '../models/user_profile.dart';

const mockUser = UserProfile(
  username: 'Baby Yoda',
  email: 'starwars@hotmail.com',
  avatarAsset: 'assets/images/avatar.png',
);

const mockCommunities = [
  Community('r/Valorant'),
  Community('r/EA Sports'),
  Community('r/Star Wars'),
  Community('r/Champions League'),
  Community('r/Real Madrid'),
];

const mockPosts = [
  Post(
    id: 'post-1',
    communityName: 'r/Valorant',
    author: 'valo_admin',
    title: 'Finally, the new agent',
    body: 'Fade and her abilities are here. Which one will you main?',
    baseVotes: 128,
  ),
  Post(
    id: 'post-2',
    communityName: 'r/Champions League',
    author: 'champion_admin',
    title: 'Champions League final',
    body: 'Real Madrid beat Liverpool in Paris 1-0, Vini Jr. scored the goal.',
    baseVotes: 342,
  ),
  Post(
    id: 'post-3',
    communityName: 'r/Star Wars',
    author: 'mandalorian',
    title: 'Best soundtrack in the saga?',
    body: 'Duel of the Fates still gives me chills. What is your pick?',
    baseVotes: 87,
  ),
];
