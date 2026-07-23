/// Survey Screen
/// Author: AZIBI AHMED
/// Interactive survey screen with progress tracking and question navigation

import 'package:flutter/material.dart';
import '../data/questions_data.dart';
import '../models/question_model.dart';
import '../widgets/question_card.dart';
import '../widgets/progress_bar.dart';
import '../widgets/custom_button.dart';

class SurveyScreen extends StatefulWidget {
  /// Callback when survey is completed with responses
  final Function(Map<int, bool> responses) onSurveyComplete;

  /// Creates a SurveyScreen
  const SurveyScreen({
    Key? key,
    required this.onSurveyComplete,
  }) : super(key: key);

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  /// List of all questions
  late List<QuestionModel> questions;

  /// Current question index
  int currentIndex = 0;

  /// Map of question ID to responses (true = yes, false = no)
  Map<int, bool> responses = {};

  /// Page controller for smooth transitions
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    questions = QuestionsData.getQuestions();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  /// Handles yes answer
  void _handleYesAnswer() {
    responses[questions[currentIndex].id] = true;
    _moveToNextQuestion();
  }

  /// Handles no answer
  void _handleNoAnswer() {
    responses[questions[currentIndex].id] = false;
    _moveToNextQuestion();
  }

  /// Moves to the next question
  void _moveToNextQuestion() {
    if (currentIndex < questions.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentIndex++;
      });
    } else {
      // Survey complete
      widget.onSurveyComplete(responses);
    }
  }

  /// Moves to the previous question
  void _moveToPreviousQuestion() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
      setState(() {
        currentIndex--;
      });
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
        child: Column(
          children: [
            // Header with progress bar
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Close button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 40,
                        height: 40,
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
                        child: const Icon(
                          Icons.close,
                          color: Color(0xFFFF69B4),
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Progress bar
                  ProgressBar(
                    progress: (currentIndex + 1) / questions.length,
                  ),
                ],
              ),
            ),

            // Questions carousel
            Expanded(
              child: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final selectedAnswer = responses[question.id];

                  return QuestionCard(
                    question: question.question,
                    currentQuestion: index + 1,
                    totalQuestions: questions.length,
                    onYes: _handleYesAnswer,
                    onNo: _handleNoAnswer,
                    selectedAnswer: selectedAnswer,
                  );
                },
              ),
            ),

            // Navigation buttons
            if (currentIndex > 0)
              Padding(
                padding: const EdgeInsets.all(20),
                child: CustomButton(
                  label: 'السؤال السابق',
                  onPressed: _moveToPreviousQuestion,
                  backgroundColor: const Color(0xFFE0E0E0),
                  textColor: const Color(0xFF666666),
                  icon: Icons.arrow_back,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
