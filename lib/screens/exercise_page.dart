import 'package:flutter/material.dart';

// This is the ExercisePage that will be pushed to the navigation stack when needed.
class ExercisePage extends StatelessWidget {
  final String workout;
  final VoidCallback onExerciseDone;

  ExercisePage({required this.workout, required this.onExerciseDone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Time for exercise!'),
            Text('Make sure to take some breaks and do not overdo!'),
            Text('There isnt any time Limit'),
            Text('Sets x 10'),
            // Assuming you have these GIFs in the correct place
            Image.asset('assets/workout_gifs/$workout.gif'),
            ElevatedButton(
              onPressed: () {
                onExerciseDone();
                Navigator.pop(context);
              },
              child: Text('Continue to Reading'),
            ),
          ],
        ),
      ),
    );
  }
}
