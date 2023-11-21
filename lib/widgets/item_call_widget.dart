import 'package:flutter/material.dart';

class ItemCallWidget extends StatelessWidget {
  const ItemCallWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
              "https://images.pexels.com/photos/712513/pexels-photo-712513.jpeg?auto=compress&cs=tinysrgb&w=600"),
        ),
        title: Text(
          "Juan Gonsalez",
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(
          children: [
            Icon(
              Icons.call_made_rounded,
              color: Color(0xff01C752),
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              "Ayer 11:02 p.m.",
              style: TextStyle(color: Colors.black45),
            ),
          ],
        ),
        trailing: Icon(
          Icons.call,
          color: Color(0xff01C752),
        ),
      ),
    );
  }
}
