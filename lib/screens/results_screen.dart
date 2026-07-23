/// Results Screen
/// Author: AZIBI AHMED
/// Displays recommended activities based on survey responses

import 'package:flutter/material.dart';
import '../data/activities_data.dart';
import '../models/activity_model.dart';
import '../widgets/activity_card.dart';
import '../widgets/custom_button.dart';

class ResultsScreen extends StatelessWidget {
  /// Map of survey responses
  final Map<int, bool> responses;

  /// Callback for navigating to activity details
  final Function(ActivityModel activity) onActivitySelected;

  /// Callback to restart the survey
  final VoidCallback onRestartPressed;

  /// Creates a ResultsScreen
  const ResultsScreen({
    Key? key,
    required this.responses,
    required this.onActivitySelected,
    required this.onRestartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get recommendations
    final recommendedIds = _getRecommendations();
    final allActivities = ActivitiesData.getAllActivities();
    final recommendations = allActivities
        .where((activity) => recommendedIds.contains(activity.id))
        .toList();

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
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Text(
                    'أنشطتك المقترحة',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFFF69B4),
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle
                  const Text(
                    'نتيجة تحليل إجاباتك، إليك 5 أنشطة مثالية لك',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF999999),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // Activities list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                itemCount: recommendations.length,
                itemBuilder: (context, index) {
                  return ActivityCard(
                    activity: recommendations[index],
                    onTap: () => onActivitySelected(recommendations[index]),
                  );
                },
              ),
            ),

            // Bottom buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomButton(
                    label: 'إعادة الاستبيان',
                    onPressed: onRestartPressed,
                    backgroundColor: const Color(0xFFFFB6C1),
                    icon: Icons.refresh,
                  ),
                  const SizedBox(height: 12),

                  // Footer
                  Center(
                    child: Column(
                      children: [
                        const Text(
                          'تطوير',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFFBBBBBB),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'AZIBI AHMED © جميع الحقوق محفوظة',
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFFCCCCCC),
                            fontWeight: FontWeight.w500,
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
      ),
    );
  }

  /// Generates activity recommendations based on responses
  List<String> _getRecommendations() {
    List<String> recommendations = [];

    // Analyze responses
    bool highEnergy = responses[1] == true || responses[4] == true;
    bool lowEnergy = responses[2] == true || responses[5] == true;
    bool hasLongTime = responses[9] == true;
    bool happyMood = responses[13] == true;
    bool anxious = responses[14] == true;
    bool sad = responses[15] == true;
    bool bored = responses[16] == true;
    bool likesEducation = responses[19] == true;
    bool likesArt = responses[20] == true;
    bool likesRelaxation = responses[21] == true;
    bool likesPhysical = responses[22] == true;
    bool wantSkills = responses[25] == true;
    bool wantFun = responses[26] == true;
    bool wantWellness = responses[27] == true;
    bool wantRest = responses[30] == true;

    // Programming if high energy + skills
    if (highEnergy && wantSkills) {
      recommendations.add('skills_2');
    }

    // Language learning if motivated
    if (wantSkills && hasLongTime) {
      recommendations.add('skills_1');
    }

    // Meditation/yoga if anxious, sad, or want relaxation
    if ((anxious || sad || likesRelaxation || lowEnergy) && !recommendations.contains('dev_1')) {
      recommendations.add('dev_1');
    }

    // Bath if low energy or want rest
    if ((lowEnergy || wantRest) && !recommendations.contains('relax_2')) {
      recommendations.add('relax_2');
    }

    // Drawing/art if creative preference or happy mood
    if ((likesArt || happyMood) && !recommendations.contains('hobby_1')) {
      recommendations.add('hobby_1');
    }

    // Movie if have time and want fun
    if ((hasLongTime || wantFun) && !recommendations.contains('entertainment_1')) {
      recommendations.add('entertainment_1');
    }

    // Fill remaining with diverse activities
    List<String> allActivities = [
      'skills_3',
      'dev_2',
      'dev_3',
      'hobby_2',
      'hobby_3',
      'relax_1',
      'relax_3',
      'entertainment_2',
    ];

    for (String activity in allActivities) {
      if (!recommendations.contains(activity) && recommendations.length < 5) {
        recommendations.add(activity);
      }
    }

    return recommendations.take(5).toList();
  }
}
