import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:rive_animation/screens/onboding/components/LoadingScreen2.dart';
import 'package:rive_animation/screens/onboding/components/profilepage.dart';
import 'LoadingScreen2.dart';

class HelloWorldPage extends StatelessWidget {
  HelloWorldPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> carouselItems = [
    {
      'image': 'https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExOXB3c25kcHp2M3Y3ank1ZHhqODlibjIwNzlzcm42eW9peGdjcmR2MSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/UgV8Y7bDxsZDCP01eo/giphy.gif',
      'caption': 'Jujutsu Kaisen'
    },
    {
      'image': 'https://31.media.tumblr.com/1cc341c66f0a980d266a1d6db7f25d88/tumblr_msy7zjba3k1s5zamxo1_500.gif',
      'caption': 'Naruto Shippuden'
    },
    {
      'image': 'https://giffiles.alphacoders.com/158/15807.gif',
      'caption': 'Bleach'
    },
  ];

  final List<Map<String, String>> gridItems = [
    {'image': 'assets/wallpaper/wall3.jpg', 'name': 'BaKi'},
    {'image': 'assets/wallpaper/wall4.jpg', 'name': 'One Piece'},
    {'image': 'assets/wallpaper/wall5.jpg', 'name': 'One Punch Man'},
    {'image': 'assets/wallpaper/wall 6.jpg', 'name': 'My Hero Academia'},
    {'image': 'assets/wallpaper/wall7.jpg', 'name': 'Blue Lock'},
    {'image': 'assets/wallpaper/wall8.jpg', 'name': 'JoJo'},
    
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: SvgPicture.asset('assets/menu_icon.svg'),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search, color: Colors.grey),
              onPressed: () {},
            ),
          ],
          elevation: 0,
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            _buildGreetingSection(),
            SizedBox(height: 16),
            _buildCarouselSlider(),
            SizedBox(height: 16),
            _buildNetflixStyleGrid(),
          ],
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }
 Future<bool> _onBackPressed(BuildContext context) async {
  bool exitConfirmed = await showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Confirm'),
      content: Text('Do you want to exit the App?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false), 
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true), 
          child: Text('Yes'),
        ),
      ],
    ),
  ) ?? false; 

  if (exitConfirmed) {
    SystemNavigator.pop(); 
    return true;
  } else {
    return false;
  }
}
  

  Widget _buildGreetingSection() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/wallpaper/wall1.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello Sam!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            'What’s your exercise today?',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.redAccent,
            ),
            child: Text('Latest Mangas'),
          ),
        ],
      ),
    );
  }

  CarouselSlider _buildCarouselSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        enlargeCenterPage: true,
        autoPlay: true,
        aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: carouselItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: item['image'],
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      color: Colors.black38,
                      child: Text(
                        item['caption'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildNetflixStyleGrid() {
  return GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 3 / 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
    ),
    itemCount: gridItems.length,
    itemBuilder: (context, index) {
      return GestureDetector( 
        onTap: () {
          if (gridItems[index]['name'] == 'BaKi') { 
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoadingScreen2(), 
            ));
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(gridItems[index]['image']!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                gridItems[index]['name']!,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      );
    },
  );
}

  BottomNavigationBar _buildBottomNavigationBar(context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
      onTap: (index) {
      if (index == 1) {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ProfilePage()));
    
  }
}
    );
  }
}