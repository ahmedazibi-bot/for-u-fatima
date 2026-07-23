/// Questions data for the survey
/// Author: AZIBI AHMED
/// Contains all 30 survey questions organized by category

import '../models/question_model.dart';

class QuestionsData {
  /// Returns all 30 survey questions
  static List<QuestionModel> getQuestions() {
    return [
      // Energy Level Questions (1-6)
      QuestionModel(
        id: 1,
        question: 'هل تشعرين بطاقة عالية اليوم؟',
        category: 'energy',
      ),
      QuestionModel(
        id: 2,
        question: 'هل تشعرين بالتعب أو الإرهاق؟',
        category: 'energy',
      ),
      QuestionModel(
        id: 3,
        question: 'هل يمكنك التركيز بسهولة؟',
        category: 'energy',
      ),
      QuestionModel(
        id: 4,
        question: 'هل تشعرين بالنشاط والحماس؟',
        category: 'energy',
      ),
      QuestionModel(
        id: 5,
        question: 'هل تشعرين بالخمول والكسل؟',
        category: 'energy',
      ),
      QuestionModel(
        id: 6,
        question: 'هل تشعرين باستعداد للقيام بأنشطة بدنية؟',
        category: 'energy',
      ),

      // Time Available Questions (7-12)
      QuestionModel(
        id: 7,
        question: 'هل لديك أقل من 30 دقيقة فقط؟',
        category: 'time',
      ),
      QuestionModel(
        id: 8,
        question: 'هل لديك حوالي ساعة واحدة؟',
        category: 'time',
      ),
      QuestionModel(
        id: 9,
        question: 'هل لديك ساعتان أو أكثر؟',
        category: 'time',
      ),
      QuestionModel(
        id: 10,
        question: 'هل تحتاجين إلى نشاط سريع وخفيف؟',
        category: 'time',
      ),
      QuestionModel(
        id: 11,
        question: 'هل لديك وقت للعمل على مشروع طويل المدى؟',
        category: 'time',
      ),
      QuestionModel(
        id: 12,
        question: 'هل الوقت محدود جداً اليوم؟',
        category: 'time',
      ),

      // Mood Questions (13-18)
      QuestionModel(
        id: 13,
        question: 'هل أنتِ في مزاج ممتاز وسعيدة؟',
        category: 'mood',
      ),
      QuestionModel(
        id: 14,
        question: 'هل تشعرين بالقلق أو التوتر؟',
        category: 'mood',
      ),
      QuestionModel(
        id: 15,
        question: 'هل تشعرين بالحزن أو الإحباط؟',
        category: 'mood',
      ),
      QuestionModel(
        id: 16,
        question: 'هل تشعرين بالملل والرتابة؟',
        category: 'mood',
      ),
      QuestionModel(
        id: 17,
        question: 'هل تشعرين بالغضب أو الانزعاج؟',
        category: 'mood',
      ),
      QuestionModel(
        id: 18,
        question: 'هل تشعرين بالهدوء والسكينة؟',
        category: 'mood',
      ),

      // Activity Type Preference (19-24)
      QuestionModel(
        id: 19,
        question: 'هل تفضلين أنشطة تعليمية وتطويرية؟',
        category: 'activity_type',
      ),
      QuestionModel(
        id: 20,
        question: 'هل تفضلين هوايات فنية وإبداعية؟',
        category: 'activity_type',
      ),
      QuestionModel(
        id: 21,
        question: 'هل تفضلين أنشطة الاسترخاء والتأمل؟',
        category: 'activity_type',
      ),
      QuestionModel(
        id: 22,
        question: 'هل تفضلين أنشطة رياضية ديناميكية؟',
        category: 'activity_type',
      ),
      QuestionModel(
        id: 23,
        question: 'هل تفضلين الأنشطة الاجتماعية والترفيهية؟',
        category: 'activity_type',
      ),
      QuestionModel(
        id: 24,
        question: 'هل تفضلين أنشطة فردية أم جماعية؟',
        category: 'activity_type',
      ),

      // Goals and Interests (25-30)
      QuestionModel(
        id: 25,
        question: 'هل تريدين تطوير مهارات جديدة؟',
        category: 'goals',
      ),
      QuestionModel(
        id: 26,
        question: 'هل تريدين الاستمتاع والترفيه البسيط؟',
        category: 'goals',
      ),
      QuestionModel(
        id: 27,
        question: 'هل تريدين الاهتمام بصحتك النفسية والجسدية؟',
        category: 'goals',
      ),
      QuestionModel(
        id: 28,
        question: 'هل تريدين قضاء وقت مع الأصدقاء والعائلة؟',
        category: 'goals',
      ),
      QuestionModel(
        id: 29,
        question: 'هل تريدين تحقيق أهداف شخصية محددة؟',
        category: 'goals',
      ),
      QuestionModel(
        id: 30,
        question: 'هل تريدين ببساطة الاسترخاء والراحة؟',
        category: 'goals',
      ),
    ];
  }
}
