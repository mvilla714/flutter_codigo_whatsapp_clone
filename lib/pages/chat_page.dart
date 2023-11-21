import 'package:flutter/material.dart';
import 'package:flutter_codigo_whatsapp_clone/data/data_dummy.dart';
import 'package:flutter_codigo_whatsapp_clone/widgets/item_chat_widget.dart';

class ChatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chats.length,
      itemBuilder: (BuildContext context, int index) {
        return ItemChatWidget(
          //avatarUrl: chats[index].avatarUrl,
          chatModel: chats[index],
        );
      },
    );
  }
}
