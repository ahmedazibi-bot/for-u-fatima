/// Activities data for recommendations
/// Author: AZIBI AHMED
/// Contains diverse activities that can be recommended to users

import '../models/activity_model.dart';

class ActivitiesData {
  /// Returns a comprehensive list of activities
  static List<ActivityModel> getAllActivities() {
    return [
      // Skills & Learning
      ActivityModel(
        id: 'skills_1',
        title: 'تعلم لغة جديدة',
        description: 'ابدأي رحلتك لتعلم لغة جديدة من خلال تطبيقات متفاعلة وممتعة.',
        steps: [
          'اختاري اللغة التي تريدين تعلمها',
          'سجلي في تطبيق تعليمي مثل Duolingo أو Babbel',
          'حددي هدفاً يومياً للدروس',
          'تحدثي مع متحدثين أصليين عند الإمكان',
          'تابعي تقدمك وقيسي إنجازاتك',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=how+to+learn+new+language',
        icon: '🌍',
        category: 'skills',
        difficulty: 'medium',
        timeRequired: 45,
      ),
      ActivityModel(
        id: 'skills_2',
        title: 'تطوير مهارات البرمجة',
        description: 'احترفي البرمجة من خلال مشاريع عملية وممتعة.',
        steps: [
          'اختاري لغة برمجة مناسبة (Python, JavaScript)',
          'ابدأي بأساسيات اللغة',
          'قومي بمشاريع صغيرة وبسيطة',
          'شارכي في مشاريع مفتوحة المصدر',
          'بني محفظة برمجية احترافية',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=beginner+programming+tutorial',
        icon: '💻',
        category: 'skills',
        difficulty: 'hard',
        timeRequired: 90,
      ),
      ActivityModel(
        id: 'skills_3',
        title: 'تحسين مهارات التواصل',
        description: 'طوري قدرتك على التحدث والاستماع الفعال.',
        steps: [
          'اقرأي عن أساسيات التواصل الفعال',
          'مارسي الاستماع النشط مع الآخرين',
          'سجلي نفسك وهي تتحدثين واستمعي للتسجيل',
          'شاركي في مجموعات نقاش',
          'اطلبي تقييماً من أشخاص موثوقين',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=effective+communication+skills',
        icon: '🗣️',
        category: 'skills',
        difficulty: 'medium',
        timeRequired: 60,
      ),

      // Self Development
      ActivityModel(
        id: 'dev_1',
        title: 'التأمل واليقظة الذهنية',
        description: 'تعلمي تقنيات التأمل لتحسين التركيز والهدوء النفسي.',
        steps: [
          'اختاري مكاناً هادئاً مريحاً',
          'اجلسي بوضعية مريحة',
          'أغلقي عينيك وركزي على تنفسك',
          'دعي الأفكار تمر دون الحكم عليها',
          'ابدأي بـ 5 دقائق وزيدي تدريجياً',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=guided+meditation+beginners',
        icon: '🧘‍♀️',
        category: 'self_development',
        difficulty: 'easy',
        timeRequired: 20,
      ),
      ActivityModel(
        id: 'dev_2',
        title: 'كتابة اليوميات والتأمل الشخصي',
        description: 'وثقي أفكارك ومشاعرك يومياً لفهم أعمق لنفسك.',
        steps: [
          'اختاري دفتر جميل أو تطبيق للكتابة',
          'اكتبي بحرية عن يومك وأفكارك',
          'اسألي نفسك أسئلة مفيدة (ما تعلمته؟ ما شعوري؟)',
          'أعيدي قراءة ما كتبتِ بعد أيام',
          'لاحظي الأنماط والنمو الشخصي',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=journaling+techniques+mental+health',
        icon: '📔',
        category: 'self_development',
        difficulty: 'easy',
        timeRequired: 30,
      ),
      ActivityModel(
        id: 'dev_3',
        title: 'قراءة كتاب تطوير ذاتي',
        description: 'استمتعي بكتب تطوير الذات والنمو الشخصي.',
        steps: [
          'اختاري كتاباً في مجال يهمك',
          'اقرأي بتركيز وانتباه',
          'دوني الملاحظات المهمة',
          'طبقي الأفكار في حياتك اليومية',
          'شارכي أفكارك مع الآخرين',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=best+self+help+books+recommendations',
        icon: '📚',
        category: 'self_development',
        difficulty: 'medium',
        timeRequired: 60,
      ),

      // Hobbies & Creativity
      ActivityModel(
        id: 'hobby_1',
        title: 'الرسم والتلوين',
        description: 'عبري عن إبداعك من خلال الفن والرسم.',
        steps: [
          'جمعي أدوات الرسم الأساسية',
          'ابحثي عن الإلهام من حولك',
          'ابدأي برسومات بسيطة',
          'جربي تقنيات مختلفة',
          'عرضي أعمالك أو احفظيها كذكرى',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=easy+drawing+for+beginners+tutorial',
        icon: '🎨',
        category: 'hobbies',
        difficulty: 'easy',
        timeRequired: 45,
      ),
      ActivityModel(
        id: 'hobby_2',
        title: 'الكتابة الإبداعية والقصص',
        description: 'أنشئي قصصك الخاصة وعالمك الخيالي.',
        steps: [
          'فكري في موضوع أو شخصية',
          'ابدأي بفكرة أساسية للقصة',
          'اكتبي المسودة الأولى بحرية',
          'عدلي وحسّني القصة',
          'شارכي قصتك مع من تثقين بهم',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=creative+writing+tips+storytelling',
        icon: '✍️',
        category: 'hobbies',
        difficulty: 'medium',
        timeRequired: 60,
      ),
      ActivityModel(
        id: 'hobby_3',
        title: 'الطبخ والخبز',
        description: 'استمتعي بتحضير أطباق وحلويات لذيذة.',
        steps: [
          'اختاري وصفة سهلة شهية',
          'اجمعي المكونات اللازمة',
          'اتبعي الخطوات بحذر وتركيز',
          'ذوقي وعدلي التوابل حسب الرغبة',
          'شاركي الطبخة مع عائلتك',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=easy+recipes+for+beginners+cooking',
        icon: '👨‍🍳',
        category: 'hobbies',
        difficulty: 'easy',
        timeRequired: 75,
      ),

      // Relaxation & Wellness
      ActivityModel(
        id: 'relax_1',
        title: 'استرخاء واليوغا',
        description: 'مارسي تمارين الاسترخاء واليوغا لتحسين صحتك.',
        steps: [
          'اختاري مكاناً هادئاً',
          'البسي ملابس مريحة',
          'ابدأي بتمارين الإحماء البسيطة',
          'مارسي حركات اليوغا الأساسية',
          'انهي بتمرين الاسترخاء النهائي',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=yoga+for+beginners+relaxation',
        icon: '🧘',
        category: 'relaxation',
        difficulty: 'easy',
        timeRequired: 40,
      ),
      ActivityModel(
        id: 'relax_2',
        title: 'حمام دافئ ومسترخي',
        description: 'خذي حماماً دافئاً مريحاً للعناية بنفسك.',
        steps: [
          'حضري ماء دافئ بدرجة حرارة مريحة',
          'أضيفي أملاح استحمام أو زيوت عطرية',
          'أطفئي الأضواء وأضيئي الشموع',
          'ضعي موسيقى هادئة',
          'استمتعي بالهدوء والاسترخاء',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=relaxation+bath+spa+tips',
        icon: '🛀',
        category: 'relaxation',
        difficulty: 'easy',
        timeRequired: 35,
      ),
      ActivityModel(
        id: 'relax_3',
        title: 'الاستماع للموسيقى والموسيقى الهادئة',
        description: 'استرخي مع موسيقى هادئة وملهمة.',
        steps: [
          'اختاري نوع موسيقى تفضلينها',
          'ابحثي عن قوائم تشغيل موسيقى هادئة',
          'اجلسي في مكان مريح',
          'أغلقي عينيك واستمعي بانتباه',
          'دعي الموسيقى تهدئ نفسيتك',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=relaxing+music+stress+relief',
        icon: '🎵',
        category: 'relaxation',
        difficulty: 'easy',
        timeRequired: 30,
      ),

      // Entertainment & Fun
      ActivityModel(
        id: 'entertainment_1',
        title: 'مشاهدة سلسلة أو فيلم',
        description: 'استمتعي بمشاهدة محتوى ترفيهي جيد.',
        steps: [
          'اختاري سلسلة أو فيلماً يناسبك',
          'اختاري منصة البث المناسبة',
          'خذي فشاراً ومشروباً مفضلاً',
          'استمتعي بالمشاهدة دون انقطاع',
          'شاركي انطباعاتك مع أصدقائك',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=best+tv+series+recommendations',
        icon: '🎬',
        category: 'entertainment',
        difficulty: 'easy',
        timeRequired: 120,
      ),
      ActivityModel(
        id: 'entertainment_2',
        title: 'لعب الألعاب والألعاب الجماعية',
        description: 'استمتعي بألعاب ممتعة وممتعة.',
        steps: [
          'اختاري لعبة تناسب مزاجك',
          'ادعي أصدقائك أو اجمعي العائلة',
          'اقرأي القواعد أو تعلميها',
          'استمتعي باللعب والضحك',
          'كرري اللعبة أو جربي لعبة جديدة',
        ],
        youtubeUrl: 'https://www.youtube.com/results?search_query=fun+games+to+play+with+friends',
        icon: '🎮',
        category: 'entertainment',
        difficulty: 'easy',
        timeRequired: 60,
      ),
    ];
  }

  /// Returns activities filtered based on survey responses
  /// [responses] - Map of question ID to yes/no response
  static List<ActivityModel> getRecommendations(Map<int, bool> responses) {
    List<ActivityModel> allActivities = getAllActivities();
    Map<String, int> categoryScores = {};

    // Calculate scores based on responses
    // High energy + interested in skills = recommend programming
    // Low energy + interested in relaxation = recommend meditation
    // Creative + free time = recommend art and writing

    // Analyze energy level
    bool highEnergy = responses[1] == true || responses[4] == true;
    bool lowEnergy = responses[2] == true || responses[5] == true;

    // Analyze time available
    bool timeConstrained = responses[7] == true || responses[12] == true;
    bool hasLongTime = responses[9] == true;

    // Analyze mood
    bool happyMood = responses[13] == true;
    bool anxiousMood = responses[14] == true;
    bool sadMood = responses[15] == true;

    // Analyze activity preferences
    bool likesEducation = responses[19] == true;
    bool likesArt = responses[20] == true;
    bool likesRelaxation = responses[21] == true;

    // Analyze goals
    bool wantSkills = responses[25] == true;
    bool wantFun = responses[26] == true;
    bool wantWellness = responses[27] == true;

    List<ActivityModel> recommendations = [];

    // Logic for activity recommendations
    if (highEnergy && wantSkills) {
      recommendations.add(allActivities.firstWhere(
        (a) => a.id == 'skills_2',
        orElse: () => allActivities[0],
      ));
    }

    if (lowEnergy || likesRelaxation) {
      recommendations.add(allActivities.firstWhere(
        (a) => a.id == 'relax_1',
        orElse: () => allActivities[0],
      ));
    }

    if (likesArt || (happyMood && wantFun)) {
      recommendations.add(allActivities.firstWhere(
        (a) => a.id == 'hobby_1',
        orElse: () => allActivities[0],
      ));
    }

    if (wantWellness) {
      recommendations.add(allActivities.firstWhere(
        (a) => a.id == 'dev_1',
        orElse: () => allActivities[0],
      ));
    }

    if (wantFun && hasLongTime) {
      recommendations.add(allActivities.firstWhere(
        (a) => a.id == 'entertainment_1',
        orElse: () => allActivities[0],
      ));
    }

    // Ensure we have exactly 5 recommendations
    while (recommendations.length < 5) {
      ActivityModel activity = allActivities[
          (recommendations.length) % allActivities.length
      ];
      if (!recommendations.contains(activity)) {
        recommendations.add(activity);
      }
    }

    return recommendations.take(5).toList();
  }
}
