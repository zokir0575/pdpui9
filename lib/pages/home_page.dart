import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9/pages/feed_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static final String id="home_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 int currentPage=0;
  var _pages = [
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
    FeedPage(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        brightness: Brightness.light,
        title: Text("Instagram", style: TextStyle(color: Colors.grey),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Feather.camera),
          color: Colors.grey,
          onPressed: (){},
        ),
        actions: [
          IconButton(
            icon: Icon(Feather.tv),
            color: Colors.grey,
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(FontAwesome.send_o),
            color: Colors.grey,
            onPressed: (){},
          ),
        ],
      ),
      body: _pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: currentPage,
        onTap: (i){
          setState(() {
            currentPage = i;
          });
        },
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedItemColor: Colors.grey.shade800,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Foundation.home),
            title: Text("Feed")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.search),
              title: Text("Search")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.plus_square),
              title: Text("Upload")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.heart),
              title: Text("Likes")
          ),
          BottomNavigationBarItem(
              icon: Icon(Feather.user),
              title: Text("Account")
          ),
        ],
      ),
    );
  }
}
