import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pdpui9/models/post_model.dart';
import 'package:pdpui9/models/story_model.dart';

class FeedPage extends StatefulWidget {

  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {

  List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Mark"),
    Story("assets/images/user_3.jpeg", "Tony"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Mark"),
    Story("assets/images/user_3.jpeg", "Tony"),
  ];

  List<Post> _posts = [
    Post(
      userName: "Tupac",
      userImage: "assets/images/user_2.jpeg",
      postImage: "assets/images/feed_2.jpeg",
      caption: "This is my first post please put likes",
    ),
    Post(
      userName: "Tupac",
      userImage: "assets/images/user_1.jpeg",
      postImage: "assets/images/feed_1.jpeg",
      caption: "This is my first post please put likes",
    ),
    Post(
      userName: "Tupac",
      userImage: "assets/images/user_3.jpeg",
      postImage: "assets/images/feed_3.jpeg",
      caption: "This is my first post please put likes",
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(),
              //#stories watch all
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Stories", style: TextStyle(color: Colors.grey, fontSize: 14),),
                    Text("Watch All", style: TextStyle(color: Colors.grey, fontSize: 14),),
                  ],
                ),
              ),

              // stories
              Container(
                width: MediaQuery.of(context).size.width,
                height: 110,
                margin: EdgeInsets.symmetric(vertical: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((story) {
                  return _ItemOfStory(story);
                }).toList(),
              ),
              ),

              //#posts
              Container(
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: _posts.length,
                  itemBuilder: (ctx, i){
                   return _itemOfPost(_posts[i]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemOfPost(Post post){
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          //#header
          Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage),
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(post.userName, style: TextStyle(color: Colors.grey),),
                  ],
                ),
                IconButton(
                  icon: Icon(SimpleLineIcons.options),
                  onPressed: (){},
                  color: Colors.grey,
                ),
              ],
            ),

    ),

          FadeInImage(
            width: MediaQuery.of(context).size.width,
            placeholder: AssetImage("assets/images/placeholder.png"),
            image: AssetImage(post.postImage),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.heart_o, color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.comment_o, color: Colors.grey,),
                  ),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(FontAwesome.send_o, color: Colors.grey),
                  ),
                ],
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(FontAwesome.bookmark_o, color: Colors.grey,),
              ),
            ],
          ),
          //#tags
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked by",
                    style: TextStyle(color: Colors.grey)
                  ),
                  TextSpan(
                      text: "Sigmund,",
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, )
                  ),
                  TextSpan(
                      text: "Yesennia,",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text: "Dayana,",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text: "and",
                      style: TextStyle(color: Colors.grey, )
                  ),
                  TextSpan(
                      text: "1263 others",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                ]
              ),
            ),
          ),
          //#caption
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: post.userName,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
                  ),
                  TextSpan(
                      text: post.caption,
                      style: TextStyle(color: Colors.grey,)
                  ),
                ]
              ),
            ),
          ),
          //#post data
          Container(
         margin: EdgeInsets.symmetric(horizontal: 14),
         alignment: Alignment.topLeft,
            child: Text(
              "February 2020",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey),
            ),
          ),
      ],
    ),
    );
  }

  Widget _ItemOfStory(Story story) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: Color(0xFF8e44ad),
            ),
          ),
          child: Container(
            padding: EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Text(story.name, style: TextStyle(color: Colors.grey),),
      ],
    );
  }
}
