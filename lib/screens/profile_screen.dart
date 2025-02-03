import 'package:flutter/material.dart';
import 'package:modern_profile/components/profile_img.dart';
import 'package:modern_profile/components/profile_menu.dart';
import 'package:modern_profile/constant/constant.dart';
import 'package:modern_profile/screens/editprofile_screen.dart';
import 'home_screen.dart';

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
    });
  }

  final List<Widget> _pages = [
    HomeScreen(),
    Text("Favorite"),
    Text("Setting"),
    EditProfileScreen(),
  ];

  final List<String> _titles = [
    "SHIBA",
    "Favorite",
    "Setting",
    "Edit Profile",
  ];

  final String logoUrl = "https://media-hosting.imagekit.io//fb2d405185d047e2/logo.png?Expires=1833221294&Key-Pair-Id=K2ZIVPTIP2VGHC&Signature=e3WScok5c7sIQz4QhFtbDLGi9JSXAY8N9Q6crEidnQXOy-qvJtEesTu-WlclCmJk~uw8QWo0XqjPH3g0-6ocdScSluxBSgX5Vjo2TiKrK04XjJz~sPjHGG8193~nxc9n8HDTSCqybwZQFuq8RZi4P77Y~uNWOvT1CD8iw1yIuhIrfR1bK0ZRtofg31xXkFgxq4idYgzjdbtqMw2stTmJF6gqM2X5rFrPf1eEDIuzPxeWe~tSKxNaORd46TcuyejDk2kmo0Arnnv2BO8djK4lfnsFAx~BYdJ6pV1frfZWj36tyKg~TCtP7u2hRSWyZET8l-SA6ETBH7RUPIG2wAdXIw__"; // โลโก้ URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[500],
        elevation: 8.0,  // เพิ่มเงาให้ AppBar
        title: _selectionItem == 0
            ? Row(
                children: [
                  Image.network(
                    logoUrl,
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10), // ระยะห่างระหว่างโลโก้และข้อความ
                  const Text(
                    "SHIBA",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Text(
                _titles[_selectionItem],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        centerTitle: true,
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // เพิ่ม Animation เวลาเปลี่ยนหน้า
        child: _pages[_selectionItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectionItem,
        onTap: _navigationBottomBar,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.green[50], // เปลี่ยนพื้นหลังของ BottomNavigationBar
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey[600],
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, size: 30),
              label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite, size: 30),
              label: 'Favorite',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 30),
              label: 'Settings',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 30),
              label: 'Profile',
          ),
        ],
      ),
    );
  }
}
