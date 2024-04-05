import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  _ProgressPageState createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  static bool hasVisitedBefore = false;
  late double progressValue;

  @override
  void initState() {
    super.initState();
    progressValue = hasVisitedBefore ? 1.0 : 0.0;
    hasVisitedBefore = true;
  }

void _showCongratulationsDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Congratulations!'),
        content: Image.asset(
          'assets/wallpaper/wall22.gif', 
          fit: BoxFit.cover,
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Close'),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
        ],
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Progress :", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("         Baki - The Grappler", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            LinearProgressIndicator(value: progressValue),
            SizedBox(height: 30),
            Text("Rewards", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            if (progressValue == 1.0) ...[
              Text("Congratulations! Reward unlocked.", style: TextStyle(color: Colors.green)),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _showCongratulationsDialog,
                child: Text('Claim Reward'),
              ),
            ] else ...[
              Text("Locked. Come back later to unlock the reward.", style: TextStyle(color: Colors.red)),
            ],
          ],
        ),
      ),
    );
  }
}
