import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_to_one/main.dart';

class ChatUserCard extends StatefulWidget {
  const ChatUserCard({super.key});

  @override
  State<ChatUserCard> createState() => _ChatUserCardState();
}

class _ChatUserCardState extends State<ChatUserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: mq.width * .015, vertical: 1),
        elevation: 0.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: InkWell(
          onTap: () {},
          child: const ListTile(
            //User Profile
            leading: CircleAvatar(child: Icon(CupertinoIcons.person)),

            //User name
            title: Text('Demo User'),

            //user last Message
            subtitle: Text('Last User Message', maxLines: 1),

            //user last message time
            trailing: Text('12:00 PM', style: TextStyle(color: Colors.black54)),
          ),
        ));
  }
}
