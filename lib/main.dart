/// FOR U FATIMA - Main Application
/// Author: AZIBI AHMED
/// A beautiful Flutter app to help determine daily activities based on mood and circumstances
/// © All Rights Reserved

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'screens/welcome_screen.dart';
import 'screens/survey_screen.dart';
import 'screens/loading_screen.dart';
import 'screens/results_screen.dart';
import 'screens/activity_detail_screen.dart';
import 'models/activity_model.dart';
import 'data/activities_data.dart';

void main() {
  runApp(const MyApp());
}

/// Main application widget
/// Author: AZIBI AHMED
class MyApp extends StatelessWidget {
  /// Creates the MyApp widget
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FOR U FATIMA',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFFFB6C1),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Color(0xFFFF69B4),
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Color(0xFF666666),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

/// Home page that manages application state and navigation
/// Author: AZIBI AHMED
class HomePage extends StatefulWidget {
  /// Creates a HomePage widget
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// State for HomePage
class _HomePageState extends State<HomePage> {
  /// Current screen index (0: welcome, 1: survey, 2: loading, 3: results, 4: detail)
  int currentScreen = 0;

  /// Survey responses map
  Map<int, bool> surveyResponses = {};

  /// Selected activity for detail view
  ActivityModel? selectedActivity;

  /// All available activities
  late List<ActivityModel> allActivities;

  @override
  void initState() {
    super.initState();
    allActivities = ActivitiesData.getAllActivities();
  }

  /// Navigate to survey screen
  void _startSurvey() {
    setState(() {
      currentScreen = 1;
    });
  }

  /// Handle survey completion
  void _handleSurveyComplete(Map<int, bool> responses) {
    surveyResponses = responses;
    setState(() {
      currentScreen = 2; // Show loading screen
    });

    // Simulate processing delay
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          currentScreen = 3; // Show results screen
        });
      }
    });
  }

  /// Navigate to activity detail screen
  void _showActivityDetail(ActivityModel activity) {
    selectedActivity = activity;
    setState(() {
      currentScreen = 4;
    });
  }

  /// Go back to results screen
  void _backToResults() {
    setState(() {
      currentScreen = 3;
    });
  }

  /// Restart the survey
  void _restartSurvey() {
    surveyResponses.clear();
    selectedActivity = null;
    setState(() {
      currentScreen = 0; // Back to welcome
    });
  }

  /// Go back to previous screen
  void _goBack() {
    if (currentScreen > 0) {
      setState(() {
        currentScreen--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildCurrentScreen(),
    );
  }

  /// Builds the current screen based on currentScreen index
  Widget _buildCurrentScreen() {
    switch (currentScreen) {
      case 0:
        // Welcome screen
        return WelcomeScreen(
          onStartPressed: _startSurvey,
        );

      case 1:
        // Survey screen
        return SurveyScreen(
          onSurveyComplete: _handleSurveyComplete,
        );

      case 2:
        // Loading screen
        return const LoadingScreen();

      case 3:
        // Results screen
        return ResultsScreen(
          responses: surveyResponses,
          onActivitySelected: _showActivityDetail,
          onRestartPressed: _restartSurvey,
        );

      case 4:
        // Activity detail screen
        if (selectedActivity != null) {
          return ActivityDetailScreen(
            activity: selectedActivity!,
            onBackPressed: _backToResults,
          );
        }
        return const SizedBox.shrink();

      default:
        return WelcomeScreen(
          onStartPressed: _startSurvey,
        );
    }
  }
}
