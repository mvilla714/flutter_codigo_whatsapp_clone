import 'package:flutter/material.dart';
import 'package:flutter_codigo_whatsapp_clone/data/data_dummy.dart';
import 'package:flutter_codigo_whatsapp_clone/models/chat_message_model.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({super.key});

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  TextEditingController chatMessageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 24,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white24,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=600"),
            ),
            SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Katy",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text("Last seen today 14:20 p.m.",
                      style: TextStyle(fontSize: 12, color: Colors.white60))
                ],
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Stack(
        children: [
          //fondo
          Container(color: Colors.black.withOpacity(0.09)),
          //listado de mensages

          ListView.builder(
            itemCount: chatMessageList.length,
            itemBuilder: (BuildContext context, int index) {
              return Align(
                alignment: chatMessageList[index].messageType == "me"
                    ? Alignment.topRight
                    : Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6.0),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: chatMessageList[index].messageType == "me"
                        ? Color(0xffE3FFC4)
                        : Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(14.0),
                      bottomRight: Radius.circular(14.0),
                      topRight: chatMessageList[index].messageType == "me"
                          ? Radius.circular(0.0)
                          : Radius.circular(14.0),
                      topLeft: chatMessageList[index].messageType == "me"
                          ? Radius.circular(14.0)
                          : Radius.circular(0.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        offset: Offset(4, 4),
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Text(
                    chatMessageList[index].messageContent,
                  ),
                ),
              );
            },
          ),

          //input de message
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: chatMessageController,
                        decoration: InputDecoration(
                          hintText: "Type message",
                          hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.black38,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          prefixIcon: Icon(
                            Icons.sentiment_satisfied_alt,
                            size: 30,
                            color: Colors.black45,
                          ),
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.attach_file),
                                color: Colors.black45,
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.camera_alt),
                                color: Colors.black45,
                              ),
                              SizedBox(
                                width: 6.0,
                              )
                            ],
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        chatMessageList.add(
                          ChatMessageModel(
                              messageContent: chatMessageController.text,
                              messageType: "me"),
                        );
                        setState(() {});
                        chatMessageController.clear();
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: Color(0xff075E54), shape: BoxShape.circle),
                        child: Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
