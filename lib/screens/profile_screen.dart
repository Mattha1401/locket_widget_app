import 'package:flutter/material.dart';
import 'package:locket/screens/frame_page.dart';
import 'package:locket/screens/friends_screen.dart';
import 'package:locket/screens/locket_gold_screen.dart';
import 'package:locket/screens/widget_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back to HomeScreen
          },
        ),
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 40),

            // Profile Picture
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.orange,
              child: CircleAvatar(
                radius: 48,
                backgroundImage: AssetImage(
                    'assets/images/aa.jpg'), 
              ),
            ),

            SizedBox(height: 8),

            // Username
            Text(
              'Puhatai',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

// Locket Gold Banner
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.amber[800],
                borderRadius: BorderRadius.circular(20),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LocketGoldScreen()), // Navigate to LocketGoldScreen
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.favorite, color: Colors.yellow),
                        SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Locket Gold',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Unlock the best of Locket',
                              style: TextStyle(
                                  color: Colors.white70, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.white, size: 16),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Friends Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: FriendSearchDelegate(),
                    );
                  },
                  child: Icon(Icons.search, color: Colors.white70),
                ),
                SizedBox(width: 8),
                Text(
                  'Friends',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 10),
            // Friends Count section in ProfileScreen
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FriendsListScreen()), // Ensure FriendsListScreen is recognized
                  );
                },
                child: Row(
                  children: [
                    Icon(Icons.group, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      '8 Friends',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.white70, size: 16),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),

            // Widgets Section Header
            Row(
              children: [
                Icon(Icons.widgets, color: Colors.white70),
                SizedBox(width: 8),
                Text(
                  'Widgets',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 10),

            // Widget Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // "Everyone" Widget Card
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icons or Profile Images Here
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage(
                                'assets/images/cp.jpg'), // Replace with actual image
                          ),
                          SizedBox(width: 4),
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: AssetImage(
                                'assets/images/ally.jpg'), // Replace with actual image
                          ),
                          SizedBox(width: 4),
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            child: Text('P',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12)),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Everyone',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      // Inside the Widget Card for "Everyone"
                      TextButton(
                        onPressed: () {
                          // Navigate to FrameSelectionPage when the Edit button is pressed
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FrameSelectionPage()),
                          );
                        },
                        child: Text(
                          'Edit',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),

                // "Create" Widget Card
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle, color: Colors.orange, size: 40),
                      SizedBox(height: 8),
                      Text(
                        'Create',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigate to WidgetPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WidgetPage(initialIndex: 0),
                            ),
                          );
                        },
                        child: Text(
                          'Create',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Spacer(),

            // Customize Button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.palette, color: Colors.white),
                SizedBox(width: 8),
                Text(
                  'Customize',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),

            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class FriendSearchDelegate extends SearchDelegate<String> {
  final List<String> friends = [
    "Phutatchai",
    "Peemtanat",
    "Marckris",
    "Kai",
    "Alan",
    "Hongholy",
    "Grace",
    "Hank",
    "Peemwasu",
  ]; // Example friend list

  @override
  String get searchFieldLabel => "Search Friends...";

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Changed from null to an empty string
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = friends
        .where((friend) => friend.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = friends
        .where((friend) => friend.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
        );
      },
    );
  }
}
