/// Model for activity suggestions
/// Author: AZIBI AHMED
/// Represents a recommended activity based on user responses
class ActivityModel {
  /// Unique identifier for the activity
  final String id;

  /// Activity title
  final String title;

  /// Detailed description of the activity
  final String description;

  /// List of step-by-step instructions
  final List<String> steps;

  /// YouTube tutorial URL
  final String youtubeUrl;

  /// Icon emoji or name
  final String icon;

  /// Activity category (skills, self-development, hobbies, relaxation, entertainment)
  final String category;

  /// Difficulty level (easy, medium, hard)
  final String difficulty;

  /// Time required in minutes
  final int timeRequired;

  /// Creates a new ActivityModel instance
  ActivityModel({
    required this.id,
    required this.title,
    required this.description,
    required this.steps,
    required this.youtubeUrl,
    required this.icon,
    required this.category,
    required this.difficulty,
    required this.timeRequired,
  });

  @override
  String toString() => 'ActivityModel(id: $id, title: $title, category: $category)';
}
