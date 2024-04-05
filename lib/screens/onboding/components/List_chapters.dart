import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/screens/onboding/components/Loadingscreen3.dart';
import 'package:rive_animation/screens/onboding/components/reading_screen.dart';
import 'hello_world_page.dart'; 

class ListChapters extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/comics/Baki_The_Grappler/Chapter1/001.jpg',
    'assets/comics/Baki_The_Grappler/Chapter2/001-1.jpg',
    'assets/comics/Baki_The_Grappler/Chapter3/001-2.jpg',
    'assets/comics/Baki_The_Grappler/Chapter4/001-3.jpg',
    'assets/comics/Baki_The_Grappler/Chapter5/001-4.jpg',
    'assets/comics/Baki_The_Grappler/Chapter6/001-5.jpg',
    'assets/comics/Baki_The_Grappler/Chapter7/001-6.jpg',
    'assets/comics/Baki_The_Grappler/Chapter8/001-7.jpg',
    'assets/comics/Baki_The_Grappler/Chapter9/001-8.jpg',
    'assets/comics/Baki_The_Grappler/Chapter10/001-9.jpg',
   
    
  ];

  final List<String> subtitles = [
    'Synchronicity',
    'America - Dorian',
     'Great Britain - Doyle',
      'Russia - Sikorsky',
       'America - Spec',
        'Japan - Ryukoh Yanagi',
         'Dark Martial Arts',
          'Show Your Face',
           'Monster',
            'Handshake',
         
   
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey[50]!, Colors.blueGrey[300]!], 
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'List of Chapters',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>LoadingScreen3()), 
                        );
                      }
                    },
                    child: Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            width: 120,
                            height: 100,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                imageUrls[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              title: Text(
                                'Chapter ${index + 1}',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                subtitles[index], 
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
