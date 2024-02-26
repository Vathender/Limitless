import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:snow_login/screens/LoadingScreen2.dart';
import 'StoryCatalog.dart';

class Firstpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/bg2.jpeg', 
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Container(color: Colors.white.withOpacity(0)), 
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  "Today's Picks",
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                     // Italic font style
                    color: Colors.black38, 
                    fontFamily: 'Monteserrat'
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: storyCatalog.length,
                  itemBuilder: (context, index) {
                    return StoryCard(
                      image: storyCatalog[index].image,
                      title: storyCatalog[index].title,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String image;
  final String title;

  StoryCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), 
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      color: Colors.white.withOpacity(0.7), 
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoadingScreen2(title: title)),
          );
        },
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20), 
              child: Image.network(
                image,
                fit: BoxFit.cover,
                height: 80.0, 
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black26, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}