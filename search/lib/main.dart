import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:search/model/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> _users = [
    User('Elinia park', '@Elinia',
        'images/christopher-campbell-rDEOVtE7vOs-unsplash.jpg', false),
    User('keyli jone', '@Keyli',
        'images/jurica-koletic-7YVZYZeITc8-unsplash.jpg', false),
    User('johni depth', '@joni', 'images/michael-dam-mEZ3PoFGs_k-unsplash.jpg',
        false)
  ];

  List<User> _foundedUser = [];

  void onSearch(String search) {
    _foundedUser = _users
        .where((user) => user.name.toLowerCase().contains(search))
        .toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _foundedUser = _users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
        title: Container(
          height: 39,
          child: TextField(
            onChanged: (value) {
              onSearch(value);
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[850],
                contentPadding: EdgeInsets.all(0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade500,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
                hintText: 'search',
                hintStyle:
                    TextStyle(color: Colors.grey.shade500, fontSize: 14)),
          ),
        ),
      ),
      body: Container(
          color: Colors.grey.shade900,
          child: _foundedUser.length > 0
              ? ListView.builder(
              itemCount: _foundedUser.length,
              itemBuilder: (context, index) {
                  return Slidable(
                    child: UserComponent(user: _foundedUser[index]),
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    actions: [
                      new IconSlideAction(
                        caption: 'Archive',
                        color: Colors.transparent,
                        icon: Icons.archive,
                        onTap: () {
                          print("archive");
                        },
                      ),
                      new IconSlideAction(
                        caption: 'Share',
                        color: Colors.transparent,
                        icon: Icons.share,
                        onTap: () {
                          print("share");
                        },
                      ),
                    ],
                    secondaryActions: [
                      new IconSlideAction(
                        caption: 'More',
                        color: Colors.transparent,
                        icon: Icons.more_horiz,
                        onTap: () {
                          print("more");
                        },
                      ),
                      new IconSlideAction(
                        caption: 'Delete',
                        color: Colors.transparent,
                        icon: Icons.delete,
                        onTap: () {
                          print("delete");
                        },
                      ),
                    ],
                  );
                })
              : Center(
                  child: Text(
                    'no user found',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
    );
  }
}

class UserComponent extends StatefulWidget {
  final User user;
  UserComponent({required this.user});

  @override
  State<UserComponent> createState() => _UserComponentState();
}

class _UserComponentState extends State<UserComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 60,
                width: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(widget.user.image, fit: BoxFit.cover,),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.user.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.user.userName,
                    style: TextStyle(color: Colors.grey[500]),
                  )
                ],
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.user.isFollowedByMe = !widget.user.isFollowedByMe;
              });
            },
            child: AnimatedContainer(
              height: 35,
              width: 110,
              duration: Duration(
                milliseconds: 300,
              ),
              decoration: BoxDecoration(
                color: widget.user.isFollowedByMe
                    ? Colors.blue[700]
                    : Color(0xffffff),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: widget.user.isFollowedByMe
                        ? Colors.transparent
                        : Colors.grey.shade700),
              ),
              child: Center(
                  child: Text(
                widget.user.isFollowedByMe ? 'unfollow' : 'follow',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
