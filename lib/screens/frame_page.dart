import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FrameSelectionPage(),
    );
  }
}

class FrameSelectionPage extends StatefulWidget {
  @override
  _FrameSelectionPageState createState() => _FrameSelectionPageState();
}

class _FrameSelectionPageState extends State<FrameSelectionPage> {
  List<Color> frameColors = [
    Colors.yellow,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple,
    Colors.grey,
  ];

  int selectedFrameIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Frame Selection'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Image or widget goes here
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: selectedFrameIndex == -1
                    ? Colors.transparent
                    : frameColors[selectedFrameIndex],
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  "Everyone",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: frameColors.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFrameIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: frameColors[index],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: selectedFrameIndex == index
                              ? Colors.white
                              : Colors.grey,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: selectedFrameIndex == index
                            ? Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              )
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the unlock frame button press
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow, // Changed from primary to backgroundColor
              ),
              child: Text(
                'Unlock Frames',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
