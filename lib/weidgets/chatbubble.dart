import 'package:chat/models/meesage.dart';
import 'package:flutter/material.dart';

class chatbubble extends StatelessWidget {
  chatbubble({
    super.key,
    required this.usermessage,
  });
  messagesmodel usermessage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(32),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 9, 25, 53),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(32))),
        child: Text(
          usermessage.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class chatbubblefriend extends StatelessWidget {
  chatbubblefriend({
    super.key,
    required this.usermessage,
  });
  messagesmodel usermessage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(32),
        margin: EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomLeft: Radius.circular(32))),
        child: Text(
          usermessage.message,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
