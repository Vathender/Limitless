import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'exercise_Page.dart';

class LoadingScreen3 extends StatelessWidget {
  final String workout;
  final VoidCallback onExerciseDone;

  const LoadingScreen3({Key? key, required this.workout, required this.onExerciseDone}) : super(key: key);

  void _navigateAfterDelay(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ExercisePage(workout: workout, onExerciseDone: onExerciseDone)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) => _navigateAfterDelay(context));
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Lottie.network('https://lottie.host/b9f6357f-2985-469f-902a-d0c223c8f072/TURGYC5ZhQ.json'),
      ),
    );
  }
}
