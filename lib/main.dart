import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCAT',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyCatScreen(),
    );
  }
}

class MyCatScreen extends StatefulWidget {
  @override
  _MyCatScreenState createState() => _MyCatScreenState();
}

class _MyCatScreenState extends State<MyCatScreen> {
  final List<Map<String, dynamic>> cats = [
    {"name": "먼치킨", "description": "엄청 귀여움", "image": "assets/cat1.jpeg", "isLiked": false},
    {"name": "노르웨이 숲", "description": "고급진", "image": "assets/cat2.jpg", "isLiked": false},
    {"name": "페르시안", "description": "못생긴", "image": "assets/cat3.jpeg", "isLiked": false},
    {"name": "브리티쉬 숏헤어", "description": "잘생긴", "image": "assets/cat4.jpeg", "isLiked": false},
    {"name": "랙돌", "description": "털쟁이", "image": "assets/cat5.jpg", "isLiked": false},

  ];

  void toggleLike(int index) {
    setState(() {
      cats[index]["isLiked"] = !cats[index]["isLiked"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyCAT'),
        backgroundColor: Color(0x3AFF96D3),
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              leading: Image.asset(cats[index]["image"]),
              title: Text('${index + 1}. ${cats[index]["name"]}', style: TextStyle(color: Colors.purple)),
              subtitle: Text(cats[index]["description"]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(
                      cats[index]["isLiked"] ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () => toggleLike(index),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.close, color: Colors.black),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
