/// Survey Processing Service
/// Author: AZIBI AHMED
/// Handles survey response processing and activity recommendation logic

class SurveyProcessorService {
  /// Processes survey responses and generates activity recommendations
  /// [responses] - Map of question ID to boolean responses (true = yes, false = no)
  /// Returns a list of recommended activity IDs
  static List<String> processResponses(Map<int, bool> responses) {
    // Analyze different aspects from survey responses
    final energyScore = _calculateEnergyScore(responses);
    final timeScore = _calculateTimeScore(responses);
    final moodScore = _calculateMoodScore(responses);
    final preferenceScore = _calculatePreferenceScore(responses);
    final goalsScore = _calculateGoalsScore(responses);

    // Generate recommendations based on scores
    return _generateRecommendations(
      energyScore: energyScore,
      timeScore: timeScore,
      moodScore: moodScore,
      preferenceScore: preferenceScore,
      goalsScore: goalsScore,
    );
  }

  /// Calculates energy level score (0-100)
  static int _calculateEnergyScore(Map<int, bool> responses) {
    int score = 0;
    
    // Q1: High energy today? +20
    if (responses[1] == true) score += 20;
    // Q2: Feeling tired? -20
    if (responses[2] == true) score -= 20;
    // Q3: Can focus easily? +15
    if (responses[3] == true) score += 15;
    // Q4: Feeling enthusiastic? +20
    if (responses[4] == true) score += 20;
    // Q5: Feeling sluggish? -20
    if (responses[5] == true) score -= 20;
    // Q6: Ready for physical activity? +15
    if (responses[6] == true) score += 15;
    
    return (score + 100).clamp(0, 100);
  }

  /// Calculates available time score (0-100)
  static int _calculateTimeScore(Map<int, bool> responses) {
    int score = 50;
    
    // Q7: Less than 30 minutes? +10 (need quick activity)
    if (responses[7] == true) score += 10;
    // Q8: About one hour? +30
    if (responses[8] == true) score += 30;
    // Q9: Two hours or more? +50
    if (responses[9] == true) score += 50;
    // Q10: Need quick activity? +10
    if (responses[10] == true) score += 10;
    // Q11: Time for long-term project? +40
    if (responses[11] == true) score += 40;
    // Q12: Very limited time? +5
    if (responses[12] == true) score += 5;
    
    return score.clamp(0, 100);
  }

  /// Calculates mood score (-50 to 50, where 0 is neutral)
  static int _calculateMoodScore(Map<int, bool> responses) {
    int score = 0;
    
    // Q13: Great mood? +30
    if (responses[13] == true) score += 30;
    // Q14: Anxious or stressed? -20
    if (responses[14] == true) score -= 20;
    // Q15: Sad or frustrated? -25
    if (responses[15] == true) score -= 25;
    // Q16: Bored? -10
    if (responses[16] == true) score -= 10;
    // Q17: Angry? -20
    if (responses[17] == true) score -= 20;
    // Q18: Calm and peaceful? +20
    if (responses[18] == true) score += 20;
    
    return score.clamp(-50, 50);
  }

  /// Calculates activity preference score based on preferences
  static Map<String, int> _calculatePreferenceScore(Map<int, bool> responses) {
    Map<String, int> preferences = {
      'educational': 0,
      'creative': 0,
      'relaxation': 0,
      'physical': 0,
      'social': 0,
    };

    // Q19: Like educational activities? 
    if (responses[19] == true) preferences['educational'] = preferences['educational']! + 25;
    // Q20: Like creative activities?
    if (responses[20] == true) preferences['creative'] = preferences['creative']! + 25;
    // Q21: Like relaxation?
    if (responses[21] == true) preferences['relaxation'] = preferences['relaxation']! + 25;
    // Q22: Like physical activities?
    if (responses[22] == true) preferences['physical'] = preferences['physical']! + 25;
    // Q23: Like social activities?
    if (responses[23] == true) preferences['social'] = preferences['social']! + 25;

    return preferences;
  }

  /// Calculates goals priority score
  static Map<String, int> _calculateGoalsScore(Map<int, bool> responses) {
    Map<String, int> goals = {
      'skills': 0,
      'entertainment': 0,
      'wellness': 0,
      'social': 0,
      'rest': 0,
    };

    // Q25: Want to develop skills?
    if (responses[25] == true) goals['skills'] = goals['skills']! + 30;
    // Q26: Want entertainment?
    if (responses[26] == true) goals['entertainment'] = goals['entertainment']! + 30;
    // Q27: Want mental/physical health?
    if (responses[27] == true) goals['wellness'] = goals['wellness']! + 30;
    // Q28: Want social time?
    if (responses[28] == true) goals['social'] = goals['social']! + 30;
    // Q29: Want to achieve goals?
    if (responses[29] == true) goals['skills'] = goals['skills']! + 20;
    // Q30: Want rest and relaxation?
    if (responses[30] == true) goals['rest'] = goals['rest']! + 30;

    return goals;
  }

  /// Generates final activity recommendations based on all scores
  static List<String> _generateRecommendations({
    required int energyScore,
    required int timeScore,
    required int moodScore,
    required Map<String, int> preferenceScore,
    required Map<String, int> goalsScore,
  }) {
    List<String> recommendations = [];

    // High energy + skills goal = programming or language learning
    if (energyScore > 70 && goalsScore['skills']! > 20) {
      recommendations.add('skills_2'); // Programming
      recommendations.add('skills_1'); // Language learning
    }

    // Medium energy + education preference = learning
    if (energyScore > 50 && preferenceScore['educational']! > 15) {
      recommendations.add('skills_3'); // Communication skills
    }

    // Low energy or anxious + want relaxation = meditation
    if (energyScore < 40 || moodScore < -15 || preferenceScore['relaxation']! > 15) {
      recommendations.add('relax_1'); // Yoga
      recommendations.add('dev_1');   // Meditation
    }

    // Happy mood + creative preference = art
    if (moodScore > 15 && preferenceScore['creative']! > 15) {
      recommendations.add('hobby_1'); // Drawing
      recommendations.add('hobby_2'); // Creative writing
    }

    // Wellness goal = self-development activities
    if (goalsScore['wellness']! > 20) {
      recommendations.add('dev_1'); // Meditation
      recommendations.add('dev_2'); // Journaling
    }

    // Entertainment goal + free time = movies/games
    if (goalsScore['entertainment']! > 20 && timeScore > 60) {
      recommendations.add('entertainment_1'); // Movies
      recommendations.add('entertainment_2'); // Games
    }

    // Social goal = cooking or group activities
    if (goalsScore['social']! > 20) {
      recommendations.add('hobby_3'); // Cooking
    }

    // Default recommendations if list is too small
    if (recommendations.isEmpty) {
      recommendations.addAll([
        'relax_2',      // Bath
        'entertainment_1',  // Movies
        'hobby_1',      // Drawing
      ]);
    }

    // Remove duplicates and return exactly 5
    List<String> uniqueRecommendations = recommendations.toSet().toList();
    
    // If we have fewer than 5, add more diverse activities
    while (uniqueRecommendations.length < 5) {
      List<String> allActivities = [
        'skills_1', 'skills_2', 'skills_3',
        'dev_1', 'dev_2', 'dev_3',
        'hobby_1', 'hobby_2', 'hobby_3',
        'relax_1', 'relax_2', 'relax_3',
        'entertainment_1', 'entertainment_2',
      ];
      
      for (String activity in allActivities) {
        if (!uniqueRecommendations.contains(activity)) {
          uniqueRecommendations.add(activity);
          if (uniqueRecommendations.length == 5) break;
        }
      }
    }

    return uniqueRecommendations.take(5).toList();
  }
}
