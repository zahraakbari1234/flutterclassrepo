import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_stub/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _auth =FirebaseAuth.instance;
var logedInUser;
class ChatScreen extends StatefulWidget {
  String id = "chat_screen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageController = TextEditingController();
  String msgText = "";
  final _auth =FirebaseAuth.instance;
  var logedInUser;
  final _firestore = FirebaseFirestore.instance;
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        logedInUser = user;
        // print(logedInUser.email);
      }
    }
    catch(e){
      print(e);
    }

  }

  void getMessages() async {
    final messages = await _firestore.collection('messages').get();
    for( var message in messages.docs){
      print(message.data());
    }
  }
  void messageStream() async {
    await for(var snapshot in _firestore.collection('messages').snapshots()){
      for(var message in snapshot.docs){
        print(message.data());
      }
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                messageStream();
                // getMessages();
                // _auth.signOut();
                // Navigator.pop(context);
                //Implement logout functionality
              }),
        ],
        title: Text('️ ChatApp '),
        backgroundColor: Colors.green[300],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MsgStreamBuilder(firestore: _firestore),
            // StreamBuilder(builder: builder)
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller:messageController ,
                      onChanged: (value) {
                        msgText = value;
                        //Do something with the user input.
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      messageController.clear();
                      _firestore.collection('messages').add({
                        'message':msgText,
                        'sender':_auth.currentUser!.email
                      });
                      //Implement send functionality.
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
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

class MsgStreamBuilder extends StatelessWidget {
  const MsgStreamBuilder({
    Key? key,
    required FirebaseFirestore firestore,
  }) : _firestore = firestore, super(key: key);

  final FirebaseFirestore _firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context,snapshot){

          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.deepPurple[300],
              ),
            );
          }


          if(snapshot.hasData){
            final messages = snapshot.data!.docs.reversed;
            List<MsgBubble> messageBubbles = [];
            for (var message in messages){
              final messageText = message.get('message');
              final messageSender = message.get('sender');
              final currentUser = _auth.currentUser!.email;

              final messageBubble = MsgBubble(sender: messageSender, message: messageText,
              isMe: currentUser == messageSender);

              messageBubbles.add(messageBubble);
            }
            return Expanded(
             child: ListView(
               reverse: true,
               padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 20),
               children: messageBubbles,
             ),

            );
          }
          return Column(
            children: [
              Text('unsuccessfull')
            ],
          );
        });
  }
}
class MsgBubble extends StatelessWidget {
  final String sender ;
  final String message;
  final bool isMe;
  MsgBubble({required this.sender , required this.message,required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender , style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),),
          SizedBox(
            height: 5,
          ),
          Material(
            elevation: 5,
            borderRadius: isMe ?  BorderRadius.only(
              topLeft:  Radius.circular(30),
              bottomRight: Radius.circular(30),
              bottomLeft: Radius.circular(30)
            ): BorderRadius.only(
                bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30)
            ),
            color: isMe ?  Colors.green[400] : Colors.grey[600],
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 20 , vertical: 10),
              child: Text(
                '${message} ',
                style: TextStyle(fontSize: 15,
                  color:  Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

