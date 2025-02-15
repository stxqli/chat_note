import 'package:flutter/material.dart';

class MessageList extends StatelessWidget {
  final List<String> messages;

  MessageList({required this.messages});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            title: Text(messages[index]),
          ),
        );
      },
    );
  }
}