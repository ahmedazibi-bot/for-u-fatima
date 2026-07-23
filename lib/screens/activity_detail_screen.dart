/// Activity Detail Screen
/// Author: AZIBI AHMED
/// Displays detailed information about a recommended activity with YouTube link

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/activity_model.dart';
import '../widgets/custom_button.dart';

class ActivityDetailScreen extends StatelessWidget {
  /// Activity to display
  final ActivityModel activity;

  /// Callback when back button is pressed
  final VoidCallback onBackPressed;

  /// Creates an ActivityDetailScreen
  const ActivityDetailScreen({
    Key? key,
    required this.activity,
    required this.onBackPressed,
  }) : super(key: key);

  /// Launches YouTube URL
  Future<void> _launchYouTube() async {
    try {
      if (await canLaunchUrl(Uri.parse(activity.youtubeUrl))) {
        await launchUrl(
          Uri.parse(activity.youtubeUrl),
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'لم يتمكن من فتح الرابط';
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
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
              Colors.white,
            ],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            // App bar with back button
            SliverAppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFFB6C1).withOpacity(0.2),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onBackPressed,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFFFF69B4),
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Activity icon with background
                    Center(
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFFFB6C1),
                              const Color(0xFFFFC0CB),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFB6C1).withOpacity(0.3),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            activity.icon,
                            style: const TextStyle(fontSize: 60),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Activity title
                    Text(
                      activity.title,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Meta info row
                    Row(
                      children: [
                        // Time
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFB6C1).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.schedule,
                                size: 16,
                                color: Color(0xFFFF69B4),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                '${activity.timeRequired} دقيقة',
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFFFF69B4),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Difficulty
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _getDifficultyColor(activity.difficulty)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _getDifficultyLabel(activity.difficulty),
                            style: TextStyle(
                              fontSize: 13,
                              color:
                                  _getDifficultyColor(activity.difficulty),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Category
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF9C27B0).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _getCategoryLabel(activity.category),
                            style: const TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9C27B0),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),

                    // Description section
                    const Text(
                      'الوصف',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 10),

                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFC0CB).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: const Color(0xFFFFB6C1),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        activity.description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF666666),
                          height: 1.6,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),

                    // Steps section
                    const Text(
                      'خطوات التنفيذ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    const SizedBox(height: 12),

                    ...List.generate(
                      activity.steps.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Step number
                            Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFFFB6C1),
                                    const Color(0xFFFFC0CB),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),

                            // Step text
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  activity.steps[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Color(0xFF666666),
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // YouTube button
                    CustomButton(
                      label: 'شاهد الفيديو التعليمي',
                      onPressed: _launchYouTube,
                      backgroundColor: const Color(0xFFFF0000),
                      icon: Icons.play_arrow,
                    ),
                    const SizedBox(height: 20),

                    // Footer
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Developed by AZIBI AHMED',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFCCCCCC),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            '© جميع الحقوق محفوظة',
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFFDDDDDD),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Returns difficulty color
  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return const Color(0xFF4CAF50);
      case 'medium':
        return const Color(0xFFFFC107);
      case 'hard':
        return const Color(0xFFF44336);
      default:
        return const Color(0xFFFFB6C1);
    }
  }

  /// Returns difficulty label in Arabic
  String _getDifficultyLabel(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return 'سهل';
      case 'medium':
        return 'متوسط';
      case 'hard':
        return 'متقدم';
      default:
        return difficulty;
    }
  }

  /// Returns category label in Arabic
  String _getCategoryLabel(String category) {
    switch (category.toLowerCase()) {
      case 'skills':
        return 'مهارات';
      case 'self_development':
        return 'تطوير ذاتي';
      case 'hobbies':
        return 'هوايات';
      case 'relaxation':
        return 'استرخاء';
      case 'entertainment':
        return 'ترفيه';
      default:
        return category;
    }
  }
}
