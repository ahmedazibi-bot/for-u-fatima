/// Welcome Screen
/// Author: AZIBI AHMED
/// Beautiful welcome screen with app branding and start button

import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  /// Callback when start button is pressed
  final VoidCallback onStartPressed;

  /// Creates a WelcomeScreen
  const WelcomeScreen({
    Key? key,
    required this.onStartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFFFF0F5),
                const Color(0xFFFFE4E1),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Top decorative shape
              Container(
                width: double.infinity,
                height: screenHeight * 0.3,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFFFFB6C1),
                      const Color(0xFFFFC0CB),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Welcome icon
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white.withOpacity(0.5),
                            blurRadius: 20,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),

              // Content section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Main title
                      const Text(
                        'FOR U FATIMA',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF69B4),
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Subtitle
                      const Text(
                        'اكتشفي أنشطتك اليومية المثالية',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF999999),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 35),

                      // Description
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFFFB6C1).withOpacity(0.2),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Text(
                          'هذا التطبيق مصمم خصيصاً لتحديد أفضل الأنشطة اليومية بناءً على حالتك المزاجية وظروفك. من خلال استبيان سريع، سنساعدك على اكتشاف أنشطة مثالية لك!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFF666666),
                            height: 1.6,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom section with button and footer
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Start button
                    CustomButton(
                      label: 'ابدأ الاستبيان',
                      onPressed: onStartPressed,
                      icon: Icons.arrow_forward,
                    ),
                    const SizedBox(height: 20),

                    // Footer
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'تطوير',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFBBBBBB),
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            'AZIBI AHMED',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF69B4),
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            '© جميع الحقوق محفوظة',
                            style: TextStyle(
                              fontSize: 11,
                              color: Color(0xFFCCCCCC),
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
      ),
    );
  }
}
