/// Activity Card Widget
/// Author: AZIBI AHMED
/// Displays a recommended activity in a beautiful card format

import 'package:flutter/material.dart';
import '../models/activity_model.dart';

class ActivityCard extends StatelessWidget {
  /// Activity data to display
  final ActivityModel activity;

  /// Callback when card is tapped
  final VoidCallback onTap;

  /// Creates an ActivityCard
  const ActivityCard({
    Key? key,
    required this.activity,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              const Color(0xFFFFC0CB).withOpacity(0.2),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFFFB6C1),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFB6C1).withOpacity(0.2),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              // Activity icon
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFFB6C1),
                      const Color(0xFFFFC0CB),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    activity.icon,
                    style: const TextStyle(fontSize: 35),
                  ),
                ),
              ),
              const SizedBox(width: 15),

              // Activity details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      activity.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Description preview
                    Text(
                      activity.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF666666),
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    // Meta info
                    Row(
                      children: [
                        // Time
                        Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              size: 14,
                              color: Color(0xFFFF69B4),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${activity.timeRequired} دقيقة',
                              style: const TextStyle(
                                fontSize: 12,
                                color: Color(0xFFFF69B4),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),

                        // Difficulty
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: _getDifficultyColor(activity.difficulty)
                                .withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _getDifficultyLabel(activity.difficulty),
                            style: TextStyle(
                              fontSize: 11,
                              color: _getDifficultyColor(activity.difficulty),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              // Arrow icon
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFFFB6C1),
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns color based on difficulty level
  Color _getDifficultyColor(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'easy':
        return const Color(0xFF4CAF50); // Green
      case 'medium':
        return const Color(0xFFFFC107); // Orange
      case 'hard':
        return const Color(0xFFF44336); // Red
      default:
        return const Color(0xFFFFB6C1);
    }
  }

  /// Returns label for difficulty level
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
}
