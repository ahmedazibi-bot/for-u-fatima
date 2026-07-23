/// Loading Screen
/// Author: AZIBI AHMED
/// Beautiful loading animation while processing survey responses

import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  /// Creates a LoadingScreen
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  /// Animation controller for the loading animation
  late AnimationController _animationController;

  /// Animation for rotating heart icon
  late Animation<double> _rotationAnimation;

  /// Animation for scaling heart icon
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * 3.14159).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xFFFFF0F5),
              const Color(0xFFFFE4E1),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated hearts
              AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _rotationAnimation.value,
                    child: Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFFB6C1),
                              const Color(0xFFFF69B4),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFF69B4).withOpacity(0.4),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 50),

              // Loading text
              const Text(
                'جاري تحليل أجواء اليوم...',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF69B4),
                  letterSpacing: 1,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 15),

              // Loading description
              const Text(
                'نبحث عن أفضل الأنشطة المناسبة لك',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF999999),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 40),

              // Animated dots
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      final offset = (_animationController.value * 3 - index) % 3;
                      final opacity =
                          (1 - (offset - 1).abs()).clamp(0.3, 1.0) as double;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFFFFB6C1)
                                .withOpacity(opacity * 0.8 + 0.2),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              const SizedBox(height: 60),

              // Footer
              const Text(
                'Developed by AZIBI AHMED',
                style: TextStyle(
                  fontSize: 11,
                  color: Color(0xFFCCCCCC),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
