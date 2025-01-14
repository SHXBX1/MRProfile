import 'package:flutter/material.dart';
import 'package:modern_profile/components/profile_img.dart';
import 'package:modern_profile/components/profile_menu.dart';
import 'package:modern_profile/constant/constant.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          SizedBox(height: 20),
          ProfileImage(),
          SizedBox(height: 20),
          Text(
            "Mr.Natdanai Nuya",
            style: TextStyle(
              color: Colors.green[800],  // สีข้อความเขียวเข้ม
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "s6503051624149@kmutnb.ac.th",
            style: TextStyle(
              color: Colors.grey[600],  // สีเทาอ่อน
              fontSize: 16,
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: 150,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.green[300],  // พื้นหลังปุ่มสีเขียวพาสเทล
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  color: Colors.white,  // สีข้อความขาว
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ProfileMenu(title: "User manage", icons: Icons.person),
          SizedBox(height: 15),
          ProfileMenu(title: "Billing Detail", icons: Icons.wallet),
          SizedBox(height: 15),
          ProfileMenu(title: "QR Code", icons: Icons.qr_code),
          SizedBox(height: 15),
          ProfileMenu(title: "Setting", icons: Icons.settings),
          SizedBox(height: 15),
          ProfileMenu(title: "Logout", icons: Icons.logout),
        ],
      ),
    );
  }
}
