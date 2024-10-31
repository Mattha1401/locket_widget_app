import 'package:flutter/material.dart';

class FriendsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              '8 out of 20 friends',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text.rich(
              TextSpan(
                text: 'Add your ',
                style: TextStyle(color: Colors.white, fontSize: 16),
                children: [
                  TextSpan(
                    text: 'siblings 👩‍👦',
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Add a new friend',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Your Friends',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Expanded(
              child: ListView(
                children: [
                  FriendTile(
                    assetImage: AssetImage('assets/images/phu.jpg'),
                    name: 'Phutatchai',
                  ),
                  FriendTile(
                    assetImage: AssetImage('assets/images/tanat.jpg'),
                    name: 'Peemtanat',
                  ),
                  FriendTile(
                    assetImage: AssetImage('assets/images/kp.jpg'),
                    name: 'khunpol',
                  ),
                  FriendTile(
                    assetImage: AssetImage('assets/images/heart.jpg'),
                    name: 'Heart',
                  ),
                  FriendTile(
                    assetImage: AssetImage('assets/images/holy.jpg'),
                    name: 'TiniTapat 💅',
                  ),
                  FriendTile(
                    assetImage: AssetImage('assets/images/alan.jpg'),
                    name: 'Hongholy',
                  ),
                  FriendTile(
                    assetImage: AssetImage('assets/images/cp.jpg'),
                    name: 'Peemwasu',
                  ),
                  FriendTile(
                    assetImage: AssetImage('assets/images/ally.jpg'),
                    name: 'Kai',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FriendTile extends StatelessWidget {
  final AssetImage assetImage;
  final String name;

  FriendTile({required this.assetImage, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[800],
            backgroundImage: assetImage,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close, color: Colors.grey[500]),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
