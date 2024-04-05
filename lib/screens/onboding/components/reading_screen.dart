import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReadingScreen extends StatefulWidget {
  @override
  _ReadingScreenState createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  final ScrollController _scrollController = ScrollController();
  final Set<int> _indicesWithPopupsShown = {};

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  List<String> generateImagePaths() {
    return List.generate(49, (index) =>
      'assets/comics/Baki_The_Grappler/Chapter1/${(index + 1).toString().padLeft(3, '0')}.jpg');
  }

  void _onScroll() {
    double itemExtent = 100.0;
    int currentIndex = (_scrollController.offset / itemExtent).floor();
    if ((currentIndex == 70 || currentIndex == 100 || currentIndex == 140) &&
        !_indicesWithPopupsShown.contains(currentIndex)) {
      _indicesWithPopupsShown.add(currentIndex);
      showPopup(context, currentIndex);
    }
  }

  void showPopup(BuildContext context, int index) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Lottie.asset(getLottieAssetForIndex(index), fit: BoxFit.cover),
          content: Text(getPopupTextForIndex(index)),
          actions: <Widget>[
            Center(
              child: TextButton(
                child: Text('Close'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ],
        );
      },
    );
  }

  String getLottieAssetForIndex(int index) {
    switch (index) {
      case 70: return 'assets/animations/pushup.json';
      case 100: return 'assets/animations/sideway.json';
      case 140: return 'assets/animations/tricep.json';
      default: return 'assets/animations/default.json';
    }
  }

  String getPopupTextForIndex(int index) {
    switch (index) {
      case 70: return 'Pushups : For effective push-ups, keep your body straight and engage your core, and lower yourself until your chest nearly touches the floor, ensuring your elbows are tucked close to your body.';
      case 100: return 'Standing Side Crunch : keep your core engaged, crunch to the side using your obliques, and ensure your movement is controlled and not driven by momentum.';
      case 140: return 'Tricep Dips : Ensure your hands are shoulder-width apart on the bench or chair, elbows pointing backwards, and lower your body slowly to maximize tricep engagement.';
      default: return 'Continue reading?';
    }
  }


  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = generateImagePaths();
    return Scaffold(
      body: ListView.builder(
        controller: _scrollController,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(8.0),
            child: Image.asset(imagePaths[index], fit: BoxFit.cover),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }
}
