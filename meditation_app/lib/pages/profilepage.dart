import 'package:flutter/material.dart';
import 'package:meditation_app/models/users.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  String userName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
        ),
      ),
      body: Column(
        children: [
          // Center(
          //   child: Image.asset(
          //     'meditation_app/lib/models/asset/profile_image.png',
          //     height: 100,
          //     width: 100,
          //   ),
          // ),
          Text('username'),
        ],
      ),
    );
  }
}
