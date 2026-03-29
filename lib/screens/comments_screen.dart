import 'package:flutter/material.dart';
import 'package:connectflow_app/utils/colors.dart'; 

class CommentsScreen extends StatefulWidget {
  final int postId;
  final String username;

  const CommentsScreen({
    super.key,
    required this.postId,
    required this.username,
  });

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentController = TextEditingController();
  final List<Map<String, dynamic>> comments = [
    {
      'id': 1,
      'username': 'sarah_johnson',
      'name': 'Sarah Johnson',
      'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
      'comment': 'This looks amazing! Keep up the great work! 🚀',
      'likes': 24,
      'time': '1h',
      'isLiked': false,
    },
    {
      'id': 2,
      'username': 'mike_chen',
      'name': 'Mike Chen',
      'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=150',
      'comment': 'Totally agree with this! Well said 👏',
      'likes': 18,
      'time': '2h',
      'isLiked': true,
    },
    {
      'id': 3,
      'username': 'emma_wilson',
      'name': 'Emma Wilson',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=150',
      'comment': 'Love this content! Can\'t wait to see more 💜',
      'likes': 31,
      'time': '3h',
      'isLiked': false,
    },
    {
      'id': 4,
      'username': 'alex_kumar',
      'name': 'Alex Kumar',
      'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=150',
      'comment': 'Incredible! You\'re so talented!',
      'likes': 15,
      'time': '5h',
      'isLiked': false,
    },
    {
      'id': 5,
      'username': 'lisa_anderson',
      'name': 'Lisa Anderson',
      'avatar': 'https://images.unsplash.com/photo-1517841905240-472988babdf9?w=150',
      'comment': 'This is exactly what I needed today! Thank you! ✨',
      'likes': 42,
      'time': '6h',
      'isLiked': true,
    },
  ];

  void _toggleCommentLike(int index) {
    setState(() {
      comments[index]['isLiked'] = !comments[index]['isLiked'];
      comments[index]['likes'] = comments[index]['isLiked'] 
          ? comments[index]['likes'] + 1 
          : comments[index]['likes'] - 1;
    });
  }

  void _sendComment() {
    if (_commentController.text.trim().isEmpty) return;
    
    setState(() {
      comments.insert(0, {
        'id': DateTime.now().millisecondsSinceEpoch,
        'username': 'you',
        'name': 'You',
        'avatar': 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
        'comment': _commentController.text.trim(),
        'likes': 0,
        'time': 'now',
        'isLiked': false,
      });
      _commentController.clear();
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.cardBackground,
        elevation: 0,
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.textPrimary,
          ),
        ),
        title: Text(
          'Comments',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: comments.length,
              itemBuilder: (context, index) {
                final comment = comments[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: NetworkImage(comment['avatar'] as String),
                        backgroundColor: AppColors.divider,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: AppColors.cardBackground,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.shadow.withOpacity(0.05),
                                    blurRadius: 5,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        comment['name'] as String,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.textPrimary,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        '@${comment['username']}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textTertiary,
                                        ),
                                      ),
                                      const Spacer(),
                                      Text(
                                        comment['time'] as String,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: AppColors.textTertiary,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    comment['comment'] as String,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textPrimary,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () => _toggleCommentLike(index),
                                    child: Row(
                                      children: [
                                        Icon(
                                          comment['isLiked'] 
                                              ? Icons.favorite_rounded 
                                              : Icons.favorite_border_rounded,
                                          size: 18,
                                          color: comment['isLiked'] 
                                              ? AppColors.like 
                                              : AppColors.textSecondary,
                                        ),
                                        const SizedBox(width: 4),
                                        Text(
                                          '${comment['likes']}',
                                          style: TextStyle(
                                            fontSize: 13,
                                            color: comment['isLiked'] 
                                                ? AppColors.like 
                                                : AppColors.textSecondary,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      'Reply',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: AppColors.textSecondary,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 12,
              bottom: MediaQuery.of(context).padding.bottom + 12,
            ),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadow.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=150',
                  ),
                  backgroundColor: AppColors.divider,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: TextField(
                      controller: _commentController,
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        hintStyle: TextStyle(
                          color: AppColors.textTertiary,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: _sendComment,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColors.gradientStart, AppColors.gradientEnd],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.send_rounded,
                      color: AppColors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}