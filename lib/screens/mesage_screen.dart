import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  // List of friends' names and corresponding image paths
  final List<String> friendNames = [
    'Phutatchai', 'Peemtanat', 'AA', 'Alan', 'Copper', 'Thai', 'Kai', 'Hongholy', 'ally', 'kp'
  ];

  final List<String> imagePaths = [
    'assets/images/phu.jpg',
    'assets/images/tanat.jpg',
    'assets/images/aa.jpg',
    'assets/images/alan.jpg',
    'assets/images/cp.jpg',
    'assets/images/thai.jpg',
    'assets/images/logo.jpg',
    'assets/images/holy.jpg',
    'assets/images/ally.jpg',
    'assets/images/kp.jpg'
  ];

  // Messages list that can be edited
  List<String> messages = List.generate(10, (index) => "whatsup Bro...");

  // Function to edit the message
  void editMessage(int index) {
    TextEditingController controller = TextEditingController(text: messages[index]);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Message for ${friendNames[index]}'),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: TextField(
              controller: controller,
              maxLines: null,
              decoration: InputDecoration(
                hintText: "Enter your message",
              ),
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  messages[index] = controller.text; // Update message
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Messages', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: friendNames.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(imagePaths[index]),
              ),
              title: Text(
                friendNames[index],
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  messages[index],
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              trailing: Text(
                '12:00 PM',
                style: TextStyle(color: Colors.white70),
              ),
              onTap: () {
                editMessage(index); // Open dialog to edit message
                
              },
            );
          },
        ),
      ),
    );
    
  }
}
