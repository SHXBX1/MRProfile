import 'package:flutter/material.dart';
import 'package:modern_profile/components/profile_img.dart';
import 'package:modern_profile/components/profile_menu.dart';
import 'package:modern_profile/constant/constant.dart';
import 'package:modern_profile/screens/editprofile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectionItem = 0;

  void _navigationBottomBar(int index) {
    setState(() {
      _selectionItem = index;
      print(index);
    });
  }

final List<Widget> _pages=[
  Text("data"),
  Text("data"),
  Text("data"),
  EditProfileScreen()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F8D0),  // สีพื้นหลังเขียวพาสเทล
      appBar: AppBar(
        backgroundColor: const Color(0xFFA5D6A7),  // สี AppBar เขียวอ่อน
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Colors.white,  // ไอคอนสีขาว
        ),
        title: Center(
          child: Text(
            "Edit Profile",
            style: TextStyle(
              color: Colors.white,  // สีข้อความขาว
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Icon(Icons.exit_to_app, size: 25, color: Colors.white),  // ไอคอนสีขาว
          SizedBox(width: 10),
        ],
      ),
      body: _pages[_selectionItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectionItem,
        onTap: _navigationBottomBar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[50],  // พื้นหลัง BottomNavigationBar เขียวอ่อน
        selectedItemColor: Colors.green[400],  // สีเขียวเมื่อเลือก
        unselectedItemColor: Colors.grey[500],  // สีไอคอนเมื่อไม่ได้เลือก
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: iconthird,  // สีเขียวสำหรับไอคอน
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: iconthird,  // สีเขียวสำหรับไอคอน
            ),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: iconthird,  // สีเขียวสำหรับไอคอน
            ),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
              color: iconthird,  // สีเขียวสำหรับไอคอน
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

