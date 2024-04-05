import 'package:flutter/material.dart';
import 'package:rive_animation/screens/onboding/components/loadingscreen5.dart';
import 'hello_world_page.dart'; 
import 'progresspage.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          SizedBox(height: 40),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('https://t4.ftcdn.net/jpg/01/04/78/75/360_F_104787586_63vz1PkylLEfSfZ08dqTnqJqlqdq0eXx.jpg'),
          ),
          SizedBox(height: 20),
          Text(
            "Sam",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text(
            "samsadams@gmail.com",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.yellow,
              shape: StadiumBorder(),
            ),
            child: Text('Upgrade to PRO', style: TextStyle(color: Colors.black)),
          ),
          _buildMenuList(context),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildMenuList(BuildContext context) {
    return Column(
      children: ListTile.divideTiles(
        color: Colors.grey[300],
        context: context,
        tiles: [
          _buildMenuItem(Icons.lock, 'Privacy', () {
            
          }),
          _buildMenuItem(Icons.history, 'Progress', () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoadingScreen5()));
          }),
          _buildMenuItem(Icons.help_outline, 'Help & Support', () {
           
          }),
          _buildMenuItem(Icons.settings, 'Settings', () {
           
          }),
          _buildMenuItem(Icons.person_add, 'Invite a Friend', () {
            
          }),
          _buildMenuItem(Icons.exit_to_app, 'Exit', () {
           
          }),
        ],
      ).toList(),
    );
  }

  ListTile _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title, style: TextStyle(color: Colors.black)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
      onTap: onTap,
    );
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 1,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      items: [
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
        if (index == 0) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HelloWorldPage()),
          );
        }
      },
    );
  }
}


