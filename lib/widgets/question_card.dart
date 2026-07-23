/// Question Card Widget
/// Author: AZIBI AHMED
/// Displays a survey question with yes/no buttons

import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  /// Question text
  final String question;

  /// Question number (e.g., "1 of 30")
  final int currentQuestion;

  /// Total questions
  final int totalQuestions;

  /// Callback for yes answer
  final VoidCallback onYes;

  /// Callback for no answer
  final VoidCallback onNo;

  /// If answer is already selected
  final bool? selectedAnswer;

  /// Creates a QuestionCard
  const QuestionCard({
    Key? key,
    required this.question,
    required this.currentQuestion,
    required this.totalQuestions,
    required this.onYes,
    required this.onNo,
    this.selectedAnswer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Question counter
            Center(
              child: Text(
                'السؤال $currentQuestion من $totalQuestions',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFFFF69B4),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Question card
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFB6C1).withOpacity(0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Question icon
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFC0CB).withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.help_outline,
                      color: Color(0xFFFF69B4),
                      size: 30,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Question text
                  Text(
                    question,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF333333),
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Yes/No buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // No button
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 60,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onNo,
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedAnswer == false
                                ? const Color(0xFFFF69B4)
                                : Colors.white,
                            border: Border.all(
                              color: const Color(0xFFFFB6C1),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              if (selectedAnswer == false)
                                BoxShadow(
                                  color: const Color(0xFFFF69B4).withOpacity(0.4),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'لا',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: selectedAnswer == false
                                    ? Colors.white
                                    : const Color(0xFFFF69B4),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Yes button
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 60,
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: onYes,
                        borderRadius: BorderRadius.circular(25),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedAnswer == true
                                ? const Color(0xFFFFB6C1)
                                : Colors.white,
                            border: Border.all(
                              color: const Color(0xFFFFB6C1),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              if (selectedAnswer == true)
                                BoxShadow(
                                  color: const Color(0xFFFFB6C1).withOpacity(0.4),
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'نعم',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: selectedAnswer == true
                                    ? Colors.white
                                    : const Color(0xFFFFB6C1),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
