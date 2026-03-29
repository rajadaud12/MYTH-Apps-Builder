import 'package:flutter/material.dart';
import 'package:swipeit_app/utils/colors.dart'; 
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Offset _dragOffset = Offset.zero;
  double _rotation = 0;
  int _currentIndex = 0;
  bool _isDragging = false;

  final List<Map<String, String>> _cards = [
    {'title': 'Amazing sunset view', 'subtitle': 'Nature • 2.5km away', 'image': 'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=800'},
    {'title': 'City night lights', 'subtitle': 'Urban • 1.2km away', 'image': 'https://images.unsplash.com/photo-1519501025264-65ba15a82390?w=800'},
    {'title': 'Mountain adventure', 'subtitle': 'Adventure • 5.8km away', 'image': 'https://images.unsplash.com/photo-1464822759023-fed622ff2c3b?w=800'},
    {'title': 'Beach paradise', 'subtitle': 'Relax • 3.4km away', 'image': 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800'},
    {'title': 'Forest trail', 'subtitle': 'Hiking • 4.1km away', 'image': 'https://images.unsplash.com/photo-1448375240586-882707db888b?w=800'},
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPanStart(DragStartDetails details) {
    setState(() {
      _isDragging = true;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragOffset += details.delta;
      _rotation = (_dragOffset.dx / 300) * 0.4;
    });
  }

  void _onPanEnd(DragEndDetails details) {
    final screenWidth = MediaQuery.of(context).size.width;
    final threshold = screenWidth * 0.3;

    if (_dragOffset.dx.abs() > threshold) {
      final direction = _dragOffset.dx > 0 ? 1 : -1;
      _animateOut(direction);
    } else {
      _resetPosition();
    }
  }

  void _animateOut(int direction) {
    final screenWidth = MediaQuery.of(context).size.width;
    final endX = direction * screenWidth * 1.5;
    final animation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset(endX, _dragOffset.dy),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    animation.addListener(() {
      setState(() {
        _dragOffset = animation.value;
        _rotation = (_dragOffset.dx / 300) * 0.4;
      });
    });

    _controller.forward(from: 0).then((_) {
      _nextCard();
    });
  }

  void _resetPosition() {
    final animation = Tween<Offset>(
      begin: _dragOffset,
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    final rotationAnimation = Tween<double>(
      begin: _rotation,
      end: 0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    ));

    animation.addListener(() {
      setState(() {
        _dragOffset = animation.value;
        _rotation = rotationAnimation.value;
      });
    });

    _controller.forward(from: 0).then((_) {
      setState(() {
        _isDragging = false;
      });
    });
  }

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _cards.length;
      _dragOffset = Offset.zero;
      _rotation = 0;
      _isDragging = false;
    });
    _controller.reset();
  }

  void _swipe(int direction) {
    _controller.duration = const Duration(milliseconds: 200);
    _animateOut(direction);
    _controller.duration = const Duration(milliseconds: 300);
  }

  Color _getOverlayColor() {
    if (_dragOffset.dx > 50) {
      final opacity = (_dragOffset.dx / 150).clamp(0.0, 0.7);
      return AppColors.like.withOpacity(opacity);
    } else if (_dragOffset.dx < -50) {
      final opacity = (-_dragOffset.dx / 150).clamp(0.0, 0.7);
      return AppColors.dislike.withOpacity(opacity);
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.secondary],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.favorite, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
            Text(
              'SwipeIt',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (_currentIndex + 1 < _cards.length)
                    _buildCard(_cards[_currentIndex + 1], false),
                  if (_currentIndex < _cards.length)
                    GestureDetector(
                      onPanStart: _onPanStart,
                      onPanUpdate: _onPanUpdate,
                      onPanEnd: _onPanEnd,
                      child: Transform.translate(
                        offset: _dragOffset,
                        child: Transform.rotate(
                          angle: _rotation,
                          child: _buildCard(_cards[_currentIndex], true),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            _buildButtons(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(Map<String, String> data, bool isTop) {
    final overlayColor = isTop ? _getOverlayColor() : Colors.transparent;
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: AppColors.cardBackground,
              child: Image.network(
                data['image']!,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    color: AppColors.cardBackground,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: AppColors.primary,
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: overlayColor,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (isTop && _dragOffset.dx > 50)
                    _buildSwipeLabel('LIKE', AppColors.like),
                  if (isTop && _dragOffset.dx < -50)
                    _buildSwipeLabel('NOPE', AppColors.dislike),
                  if (isTop && _dragOffset.dx.abs() <= 50)
                    const SizedBox(width: 60),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.white, size: 14),
                        const SizedBox(width: 4),
                        Text(
                          'Swipe to explore',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.place, color: Colors.white.withOpacity(0.8), size: 16),
                        const SizedBox(width: 4),
                        Text(
                          data['subtitle']!,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.8),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwipeLabel(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        border: Border.all(color: color, width: 3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton(
            icon: Icons.close,
            color: AppColors.dislike,
            size: 60,
            onTap: () => _swipe(-1),
          ),
          _buildButton(
            icon: Icons.star,
            color: AppColors.accent,
            size: 50,
            onTap: () => _swipe(0),
          ),
          _buildButton(
            icon: Icons.favorite,
            color: AppColors.like,
            size: 60,
            onTap: () => _swipe(1),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required Color color,
    required double size,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: color,
          size: size * 0.5,
        ),
      ),
    );
  }
}