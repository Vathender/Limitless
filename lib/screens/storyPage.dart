import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'exercise.dart';
import 'StoryCollection.dart';
import 'exercise_page.dart'; 
import 'LoadingScreen3.dart'; 

class StoryPage extends StatefulWidget {
  final String title; // Ithu thaan Manga title
  final int chapter;

  StoryPage({required this.title, required this.chapter});

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late Map<int, String> workouts;
  late Map<int, int> seen;

  @override
  void initState() {
    super.initState();
    workouts = exercise[widget.title]![widget.chapter];
    seen = Map.fromIterables(workouts.keys, Iterable.generate(workouts.length, (_) => 0));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Exit'),
            content: const Text('Your Progress will be lost, Do you want to quit?'),
            actions: [
              TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes')),
              TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No', style: TextStyle(color: Colors.red))),
            ],
          ),
        );
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
          itemCount: story[widget.title]![widget.chapter].length - 2,
          itemBuilder: (context, index) {
            if (workouts.containsKey(index) && seen[index] == 0) {
              Future.delayed(Duration.zero, () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoadingScreen3(
                      workout: workouts[index]!,
                      onExerciseDone: () => setState(() => seen[index] = 1),
                    ),
                  ),
                );
              });
            }

            return CachedNetworkImage(
              imageUrl: story[widget.title]![widget.chapter][index + 1],
              placeholder: (context, url) => Image.asset('assets/Placeholder/placeholder.jpg'),
              errorWidget: (context, url, error) => Icon(Icons.error),
            );
          },
        ),
      ),
    );
  }
}
