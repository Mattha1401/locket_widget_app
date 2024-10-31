import 'package:flutter/material.dart';

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> with SingleTickerProviderStateMixin {
  // Categories and their images
  final Map<String, List<String>> categoryImages = {
    'All': [
      'assets/images/phu.jpg',
      'assets/images/aa.jpg',
      'assets/images/alan.jpg',
      'assets/images/p4.jpg',
      'assets/images/p5.jpg',
      'assets/images/p6.jpg',
      'assets/images/d1.jpg',
      'assets/images/d2.jpg',
      'assets/images/d3.jpg',
      'assets/images/d4.jpg',
      'assets/images/d5.jpg',
      'assets/images/d6.jpg',
      'assets/images/p1.png',
      'assets/images/p2.png',
      'assets/images/p3.png',
    ],
    'Favorites': [
      'assets/images/d1.jpg',
      'assets/images/d2.jpg',
      'assets/images/d3.jpg',
      'assets/images/p3.png',
      'assets/images/p5.jpg',
      'assets/images/p6.jpg',
  
    ],
    'Place': [
      'assets/images/p4.jpg',
      'assets/images/p5.jpg',
      'assets/images/p6.jpg',
      
    ],
    'People': [
      'assets/images/aa.jpg',
      'assets/images/alan.jpg',
      'assets/images/phu.jpg',
      'assets/images/p1.png',
      'assets/images/p2.png',
      'assets/images/p3.png',
      'assets/images/d1.jpg',
      'assets/images/d2.jpg',
      'assets/images/d3.jpg',
    ],
  };

  // Current selected category
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: categoryImages.keys.length,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Album', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                selectedCategory = categoryImages.keys.elementAt(index);
              });
            },
            isScrollable: true,
            tabs: categoryImages.keys.map((category) => Tab(text: category)).toList(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: categoryImages[selectedCategory]!.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(categoryImages[selectedCategory]![index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
