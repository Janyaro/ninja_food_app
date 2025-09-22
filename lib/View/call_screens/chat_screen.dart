import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/View/call_screens/call_screen.dart';
import 'package:food_app/View/rate_food_screens/ratefood_screen.dart';

class ChatScreen extends StatefulWidget {
  final String currentUserId;
  final String otherUserId;
  final String otherUsername;
   final String imageUrl;
  ChatScreen({
    required this.currentUserId,
    required this.otherUserId,
    required this.otherUsername,
    required this.imageUrl
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late  final String userImage ;
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  void sendMessage() {
    final text = messageController.text.trim();
    if (text.isNotEmpty) {
      FirebaseFirestore.instance.collection('messages').add({
        'from': widget.currentUserId,
        'to': widget.otherUserId,
        'text': text,
        'timestamp': Timestamp.now(),
      });
      messageController.clear();

      // Auto-scroll to bottom after sending
      Future.delayed(Duration(milliseconds: 300), () {
        if (_scrollController.hasClients) {
          _scrollController.jumpTo(
            _scrollController.position.maxScrollExtent,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Screen dimensions

    return Scaffold(
      appBar: AppBar(title: Text(widget.otherUsername) , actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
          style: IconButton.styleFrom(backgroundColor: Colors.green[100]),
          onPressed: (){
            Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CallScreen(
                userName: widget.otherUsername,
                userImage:widget.imageUrl, // TODO: replace with real user image
              ),
            ),
          );
          }, icon: Icon(Icons.call_rounded , size: 20,color:Colors.white, )),
        )],),
      body: Column(
        children: [
          // Chat messages section
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('messages')
                  .orderBy('timestamp')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs.where((doc) =>
                    (doc['from'] == widget.currentUserId &&
                        doc['to'] == widget.otherUserId) ||
                    (doc['from'] == widget.otherUserId &&
                        doc['to'] == widget.currentUserId)).toList();

                return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final doc = messages[index];
                    final isMe = doc['from'] == widget.currentUserId;

                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        constraints: BoxConstraints(
                          maxWidth: size.width * 0.7, // Responsive width
                        ),
                        margin:
                            EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        decoration: BoxDecoration(
                          color: isMe ? Colors.blue[200] : Colors.grey[300],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(14),
                            topRight: Radius.circular(14),
                            bottomLeft:
                                isMe ? Radius.circular(14) : Radius.zero,
                            bottomRight:
                                isMe ? Radius.zero : Radius.circular(14),
                          ),
                        ),
                        child: Text(
                          doc['text'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Message input section
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: messageController,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      ),
                    ),
                  ),
                  SizedBox(width: 6),
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: IconButton(
                      icon: Icon(Icons.send, color: Colors.white),
                      onPressed: sendMessage,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
