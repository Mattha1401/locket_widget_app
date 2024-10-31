import 'package:flutter/material.dart';
import 'package:locket/screens/mesage_screen.dart';


import 'profile_screen.dart';
import 'friends_screen.dart';
import 'album_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> images = [
    'assets/images/first1.jpg',
    'assets/images/aa.jpg',
    'assets/images/phu.jpg',
    'assets/images/alan.jpg',
    'assets/images/cp.jpg',
    'assets/images/heart.jpg',

  ];

  // Create a PageController
  late PageController _pageController;
  double _circleIconScale = 1.0; // Scale for bounce effect

  @override
  void initState() {
    super.initState();
    // Initialize the PageController
    _pageController = PageController();
  }

  @override
  void dispose() {
    // Dispose the PageController when done
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Scrollable images using PageView with vertical scroll and frames
          Positioned.fill(
            child: PageView.builder(
              controller: _pageController, // Assign the PageController
              scrollDirection: Axis.vertical,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.grey[900],
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1.0,
                      height: MediaQuery.of(context).size.width * 1.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color.fromARGB(255, 33, 33, 33), width: 2),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey,
                              child: Center(child: Text('Image not available', style: TextStyle(color: Colors.white))),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Top bar with profile icon and buttons
          Positioned(
            top: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProfileAvatar(context),
                _buildTopIcons(context),
              ],
            ),
          ),
          // Centered Friends Icon and Count with Overlay Button
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.group, color: Colors.white),
                        SizedBox(width: 4),
                        Text('8 Friends', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => FriendsListScreen()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom row with Album icon
          Positioned(
            bottom: 40,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildAlbumIcon(context),
                _buildCircleIcon(), // Circle icon placed here
                _buildHistoryIcon(), // History icon placed here
              ],
            ),
          ),
          // Additional UI elements on the screen
          Positioned(
            
            top: MediaQuery.of(context).size.height * 0.3,
            left: 16,
            child: Icon(Icons.flash_on, color: Colors.amber),
          ),
          
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            right: 16,
            child: Text(
              '1x',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileAvatar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen()),
        );
      },
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/images/aa.jpg'),
        radius: 18,
      ),
    );
  }

  Widget _buildTopIcons(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MessageScreen()),
            );
          },
          child: Icon(Icons.message, color: Colors.white),
        ),
        CircleAvatar(
          radius: 8,
          backgroundColor: Colors.orange,
          child: Text(
            '10',
            style: TextStyle(color: Colors.white, fontSize: 10),
          ),
        ),
      ],
    );
  }

  Widget _buildAlbumIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AlbumScreen()),
        );
      },
      child: Icon(Icons.image, color: Colors.white, size: 30),
    );
  }

  Widget _buildCircleIcon() {
    return GestureDetector(
      onTapDown: (_) {
        // Scale down on press
        setState(() {
          _circleIconScale = 0.9; // Decrease size for bounce effect
        });
      },
      onTapUp: (_) {
        // Scale back to original size and navigate to first image
        setState(() {
          _circleIconScale = 1.0; // Restore size
        });
        // Go back to the first image
        _pageController.jumpToPage(0);
      },
      onTapCancel: () {
        // Reset scale if the tap is cancelled
        setState(() {
          _circleIconScale = 1.0; // Restore size
        });
      },
      child: Transform.scale(
        scale: _circleIconScale, // Apply scale transformation
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.orange,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.circle, color: Colors.white, size: 70),
        ),
      ),
    );
  }

  Widget _buildHistoryIcon() {
    return GestureDetector(
      onTap: () {
        // Go back to the first image
        _pageController.jumpToPage(0);
      },
      child: Icon(Icons.history, color: Colors.white, size: 30),
    );
  }
}