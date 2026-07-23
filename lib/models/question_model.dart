/// Model for survey questions
/// Author: AZIBI AHMED
/// Represents a single question in the survey with its properties
class QuestionModel {
  /// Unique identifier for the question
  final int id;

  /// The question text
  final String question;

  /// The category this question belongs to (energy, time, mood, activity_type, goals)
  final String category;

  /// Creates a new QuestionModel instance
  /// [id]: Unique identifier
  /// [question]: The question text to display
  /// [category]: Category for survey analysis
  const QuestionModel({
    required this.id,
    required this.question,
    required this.category,
  });

  @override
  String toString() => 'QuestionModel(id: $id, category: $category)';
}
