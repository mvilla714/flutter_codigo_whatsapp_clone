import 'package:flutter/material.dart';
import 'package:flutter_codigo_whatsapp_clone/models/chat_model.dart';
import 'package:flutter_codigo_whatsapp_clone/pages/chat_detail_page.dart';

class ItemChatWidget extends StatelessWidget {
  //String avatarUrl;
  //ItemChatWidget({required this.avatarUrl});
  ChatModel chatModel;
  ItemChatWidget({required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ChatDetailPage()));
        },
        leading: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 26,
          backgroundImage: NetworkImage(chatModel.avatarUrl),
        ),
        title: Text(
          chatModel.userName,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          chatModel.isTyping ? "Typing..." : chatModel.message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: chatModel.isTyping ? Color(0xff00C752) : Colors.black45,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              chatModel.time,
              style: TextStyle(
                fontSize: 12,
                color: chatModel.countMessage > 0
                    ? Color(0xff00C752)
                    : Colors.black45,
              ),
            ),
            chatModel.countMessage > 0
                ? Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Color(0xff00C752),
                      shape: BoxShape.circle,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      chatModel.countMessage.toString(),
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    ),
                  )
                : SizedBox()
          ],
        ),
      ),
    );
  }
}
