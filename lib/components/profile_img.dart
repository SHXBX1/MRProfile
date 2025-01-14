import 'package:flutter/material.dart';
import 'package:modern_profile/constant/constant.dart';


class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                backgroundColor: Colors.lightGreen,
                radius: 60,
                child: CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage(
                      'images/images.jpg'), // ใช้ backgroundImage แทน backgroundColor
                ),
              ),
              CircleAvatar(
                backgroundColor: bgPrimaryColor,
                radius: 22,
                child: CircleAvatar(
                  backgroundColor: Colors.lightGreen,
                  child: Icon(
                    Icons.edit,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
    );
  }
}