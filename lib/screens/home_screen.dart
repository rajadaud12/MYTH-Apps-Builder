import 'package:flutter/material.dart';
import 'package:connectflow_app/utils/colors.dart'; 
import 'package:connectflow_app/screens/user_profile_screen.dart'; 
import 'package:connectflow_app/screens/comments_screen.dart'; 

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> posts = [
    {
      'id': 1,
      'username': 'sarah_johnson',
      'name': 'Sarah Johnson',
      'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
      'content': 'Just finished an amazing workout session! 💪 Feeling energized and ready to take on the day. Who else loves morning exercises?',
      'image': 'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=800',
      'likes': 234,
      'comments': 45,
      'time': '2h',
      'isLiked': false,
    },
    {
      'id': 2,
      'username': 'mike_chen',
      'name': 'Mike Chen',
      'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      'content': 'New project launched! Check out our latest feature update. The team has been working incredibly hard on this one.',
      'image': null,
      'likes': 189,
      'comments': 32,
      'time': '4h',
      'isLiked': true,
    },
    {
      'id': 3,
      'username': 'emma_wilson',
      'name': 'Emma Wilson',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
      'content': 'Beautiful sunset at the beach today. Nature never fails to amaze me. 🌅',
      'image': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
      'likes': 567,
      'comments': 89,
      'time': '6h',
      'isLiked': false,
    },
    {
      'id': 4,
      'username': 'alex_kumar',
      'name': 'Alex Kumar',
      'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
      'content': 'Coffee and code - the perfect combination for a productive Monday! ☕💻',
      'image': 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=800',
      'likes': 421,
      'comments': 67,
      'time': '8h',
      'isLiked': true,
    },
  ];

  final List<Map<String, dynamic>> stories = [
    {'username': 'your_story', 'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150', 'isAdd': true},
    {'username': 'sarah_johnson', 'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150', 'isAdd': false},
    {'username': 'mike_chen', 'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150', 'isAdd': false},
    {'username': 'emma_wilson', 'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150', 'isAdd': false},
    {'username': 'alex_kumar', 'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150', 'isAdd': false},
    {'username': 'lisa_anderson', 'avatar': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150', 'isAdd': false},
  ];

  void _toggleLike(int index) {
    setState(() {
      posts[index]['isLiked'] = !posts[index]['isLiked'];
      posts[index]['likes'] = posts[index]['isLiked'] 
          ? posts[index]['likes'] + 1 
          : posts[index]['likes'] - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              backgroundColor: AppColors.cardBackground,
              elevation: 0,
              toolbarHeight: 70,
              title: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.gradientStart, AppColors.gradientEnd],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.connect_without_contact_rounded,
                      color: AppColors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'ConnectFlow',
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border_rounded,
                    color: AppColors.textPrimary,
                    size: 28,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.messenger_outline_rounded,
                    color: AppColors.textPrimary,
                    size: 28,
                  ),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  _buildStoriesSection(),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildPostCard(index),
                childCount: posts.length,
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 110,
      color: AppColors.cardBackground,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return GestureDetector(
            onTap: () {
              if (!story['isAdd']) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserProfileScreen(
                      username: story['username'] as String,
                      avatar: story['avatar'] as String,
                    ),
                  ),
                );
              }
            },
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      gradient: story['isAdd']
                          ? null
                          : LinearGradient(
                              colors: [AppColors.gradientStart, AppColors.gradientEnd],
                            ),
                      borderRadius: BorderRadius.circular(25),
                      border: story['isAdd']
                          ? Border.all(color: AppColors.divider, width: 2)
                          : null,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        borderRadius: BorderRadius.circular(23),
                      ),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundImage: NetworkImage(story['avatar'] as String),
                            backgroundColor: AppColors.divider,
                          ),
                          if (story['isAdd'])
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppColors.primary,
                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.white, width: 2),
                                ),
                                child: Icon(
                                  Icons.add,
                                  size: 12,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    story['isAdd'] ? 'Your Story' : (story['username'] as String).split('_').first,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPostCard(int index) {
    final post = posts[index];
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: AppColors.cardBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserProfileScreen(
                          username: post['username'] as String,
                          avatar: post['avatar'] as String,
                        ),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(post['avatar'] as String),
                    backgroundColor: AppColors.divider,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserProfileScreen(
                                username: post['username'] as String,
                                avatar: post['avatar'] as String,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          post['name'] as String,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Text(
                        '@${post['username']} • ${post['time']}',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_horiz,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post['content'] as String,
              style: TextStyle(
                fontSize: 15,
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
          ),
          if (post['image'] != null) ...[
            const SizedBox(height: 12),
            Container(
              height: 280,
              decoration: BoxDecoration(
                color: AppColors.divider,
              ),
              child: Image.network(
                post['image'] as String,
                fit: BoxFit.cover,
                width: double.infinity,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: AppColors.primary,
                      strokeWidth: 2,
                    ),
                  );
                },
              ),
            ),
          ],
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                _buildActionButton(
                  icon: post['isLiked'] 
                      ? Icons.favorite_rounded 
                      : Icons.favorite_border_rounded,
                  label: '${post['likes']}',
                  color: post['isLiked'] ? AppColors.like : AppColors.textSecondary,
                  onTap: () => _toggleLike(index),
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.chat_bubble_outline_rounded,
                  label: '${post['comments']}',
                  color: AppColors.textSecondary,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CommentsScreen(
                          postId: post['id'] as int,
                          username: post['username'] as String,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 24),
                _buildActionButton(
                  icon: Icons.share_outlined,
                  label: 'Share',
                  color: AppColors.textSecondary,
                  onTap: () {},
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: AppColors.divider, height: 1),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}