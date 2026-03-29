import 'package:flutter/material.dart';
import 'package:connectflow_app/utils/colors.dart'; 
import 'package:connectflow_app/screens/user_profile_screen.dart'; 
import 'package:connectflow_app/screens/comments_screen.dart'; 

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> myPosts = [
    {
      'id': 1,
      'username': 'you',
      'name': 'You',
      'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
      'content': 'My first post! Excited to be here on ConnectFlow! 🚀',
      'image': 'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=800',
      'likes': 156,
      'comments': 23,
      'time': '1d',
      'isLiked': true,
    },
    {
      'id': 2,
      'username': 'you',
      'name': 'You',
      'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
      'content': 'Sharing my latest project update. What do you think?',
      'image': null,
      'likes': 89,
      'comments': 15,
      'time': '3d',
      'isLiked': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 380,
              backgroundColor: AppColors.cardBackground,
              toolbarHeight: 70,
              title: Text(
                'Profile',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.settings_outlined,
                    color: AppColors.textPrimary,
                    size: 26,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: _buildProfileHeader(),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: AppColors.primary,
                  unselectedLabelColor: AppColors.textSecondary,
                  indicatorColor: AppColors.primary,
                  indicatorWeight: 3,
                  tabs: const [
                    Tab(icon: Icon(Icons.grid_on_rounded), text: 'Posts'),
                    Tab(icon: Icon(Icons.bookmark_border_rounded), text: 'Saved'),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildPostsGrid(),
            _buildSavedGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 50),
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.gradientStart, AppColors.gradientEnd],
                  ),
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                  ),
                  backgroundColor: AppColors.divider,
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.cardBackground, width: 3),
                  ),
                  child: Icon(
                    Icons.camera_alt,
                    color: AppColors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Alex Morgan',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '@alexmorgan',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Digital creator & entrepreneur. Love sharing ideas and connecting with amazing people! ✨',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('1,234', 'Followers'),
              Container(
                height: 40,
                width: 1,
                color: AppColors.divider,
              ),
              _buildStatItem('567', 'Following'),
              Container(
                height: 40,
                width: 1,
                color: AppColors.divider,
              ),
              _buildStatItem('89', 'Posts'),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share_outlined,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildPostsGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: myPosts.length,
      itemBuilder: (context, index) {
        final post = myPosts[index];
        return GestureDetector(
          onTap: () {},
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (post['image'] != null)
                Image.network(
                  post['image'],
                  fit: BoxFit.cover,
                )
              else
                Container(
                  color: AppColors.divider,
                  child: Icon(
                    Icons.article_outlined,
                    color: AppColors.textSecondary,
                    size: 40,
                  ),
                ),
              if (post['likes'] > 0)
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.black.withValues(alpha: 0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: AppColors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${post['likes']}',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSavedGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1682687220742-aba13b6e50ba?w=800',
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.black.withValues(alpha: 0.6),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.bookmark,
                  color: AppColors.white,
                  size: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _SliverTabBarDelegate(this.tabBar);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: AppColors.cardBackground,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}