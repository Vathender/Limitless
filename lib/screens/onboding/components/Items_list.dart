import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:rive_animation/screens/onboding/components/List_chapters.dart';
import 'hello_world_page.dart';  
class itemslist extends StatelessWidget {
   final List<String> imagePaths = [
    'assets/wallpaper/wall10.jpg', 
    'assets/wallpaper/wall11.jpg', 
    'assets/wallpaper/wall12.jpg', 
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueGrey, Colors.black],
              ),
            ),
          ),
          Column(
            children: <Widget>[
       Expanded(
      flex: 2,
      child: CarouselSlider(
        options: CarouselOptions(height: 400.0, autoPlay: true),
        items: imagePaths.map((path) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(path),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    ),

              ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  color: Colors.white.withOpacity(0.8),
                  height: 250, 
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Baki is a gripping anime and manga series centered around Baki Hanma as he trains with intense focus to surpass his father, Yujiro Hanma, the strongest fighter in the world.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.notoSans(fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
  child: Text(
    'Start Reading',
    style: TextStyle(color: Colors.white),
  ),
  style: ElevatedButton.styleFrom(
    primary: Colors.deepPurple, 
    onPrimary: Colors.white, 
    shadowColor: Colors.deepPurpleAccent, 
    elevation: 5, 
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30), 
    ),
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), 
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListChapters()),
    );
  },
),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);

    var controlPoint = Offset(size.width / 2, size.height);
    var endPoint = Offset(size.width, size.height - 50);

    path.quadraticBezierTo(
      controlPoint.dx,
      controlPoint.dy,
      endPoint.dx,
      endPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}