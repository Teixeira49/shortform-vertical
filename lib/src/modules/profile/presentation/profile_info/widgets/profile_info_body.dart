part of '../page/profile_info_page.dart';

class _ProfileInfoBody extends StatelessWidget {
  const _ProfileInfoBody({
    super.key,
    required this.user,
    required this.isMe,
    required this.isFollowing,
    required this.onFollow,
    required this.onUnfollow,
  });

  final User user;
  final bool isMe;
  final bool isFollowing;
  final VoidCallback onFollow;
  final VoidCallback onUnfollow;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileHeader(
            user: user,
            isMe: isMe,
            isFollowing: isFollowing,
            onFollow: onFollow,
            onUnfollow: onUnfollow,
          ),
          const SizedBox(height: 16),
          const ProfileTabBar(),
        ],
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
    required this.isMe,
    required this.isFollowing,
    required this.onFollow,
    required this.onUnfollow,
  });

  final User user;
  final bool isMe;
  final bool isFollowing;
  final VoidCallback onFollow;
  final VoidCallback onUnfollow;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(WidthValues.spacingLg),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'), //user.profilePictureUrl
        ),
        Gap(WidthValues.spacing2Md),
        Text(
          user.name,
        ),
        Text(
          user.lastname,
        ),
        Gap(WidthValues.spacingMd),
        if (!isMe)
          ElevatedButton(
            onPressed: isFollowing ? onUnfollow : onFollow,
            child: Text(isFollowing ? 'Unfollow' : 'Follow'),
          ),
        if (isMe)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: isFollowing ? onUnfollow : onFollow,
                child: Text('Share perfil'),
              ),
              ElevatedButton(
                onPressed: isFollowing ? onUnfollow : onFollow,
                child: Text('Edit perfil'),
              ),
            ],
          )
      ],
    );
  }
}

class ProfileTabBar extends StatefulWidget {
  const ProfileTabBar({super.key});

  @override
  State<StatefulWidget> createState() => ProfileTabBarState();
}

class ProfileTabBarState extends State<ProfileTabBar> {
  @override
  void initState() {
    super.initState();
    // Initialize any state here if needed
  }

  @override
  void dispose() {
    // Dispose any resources here if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Posts', icon: Icon(Icons.post_add)),
              Tab(text: 'Saved', icon: Icon(Icons.book_outlined)),
              Tab(text: 'History', icon: Icon(Icons.history)),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 400,
            child: TabBarView(
              children: [
                PostsTab(),
                SavedTab(),
                HistoryTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PostsTab extends StatelessWidget {
  const PostsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Posts Tab'),
    );
  }
}

class SavedTab extends StatelessWidget {
  const SavedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Saved Tab'),
    );
  }
}

class HistoryTab extends StatelessWidget {
  const HistoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('History Tab'),
    );
  }
}