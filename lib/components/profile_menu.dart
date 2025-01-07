// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:modern_profile/constant/constant.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final IconData icons;
  
  const ProfileMenu({
    super.key,
    required this.title,
    required this.icons,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: bgSecondaryColor,
            child: Icon(icons,size: 24,color: textSecondary,),
          ),
          SizedBox(width: 15,),
          Text(title,style: textSubTitle,),
          SizedBox(width: 15,),
          Spacer(),
          CircleAvatar(
            backgroundColor: bgSecondaryColor,
            child: Icon(Icons.arrow_forward_ios,size: 16,color: iconSecondary,),
            
          )
        ],
      ),
    
    );
  }
}
