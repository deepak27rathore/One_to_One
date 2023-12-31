import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_to_one/Screens/chat_screen.dart';
import 'package:one_to_one/main.dart';
import 'package:one_to_one/models/chat_user.dart';

class ChatUserCard extends StatefulWidget {
  final ChatUser user;

  const ChatUserCard({super.key, required this.user});

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
          onTap: () {
            //for navigating to chat screen
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ChatScreen(
                          user: widget.user,
                        )));
          },
          child: ListTile(
              //User Profile
              //leading: const CircleAvatar(child: Icon(CupertinoIcons.person)),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(mq.height * .3),
                child: CachedNetworkImage(
                  width: mq.height * .055,
                  height: mq.height * 0.055,
                  imageUrl: widget.user.image,
                  errorWidget: (context, url, error) =>
                      CircleAvatar(child: Icon(CupertinoIcons.person)),
                ),
              ),
              //User name
              title: Text(widget.user.name),

              //user last Message
              subtitle: Text(widget.user.about, maxLines: 1),

              //user last message time
              trailing: Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    color: Colors.greenAccent.shade400,
                    borderRadius: BorderRadius.circular(10)),
              )
              // trailing:
              // const Text('12:00 PM', style: TextStyle(color: Colors.black54)),
              ),
        ));
  }
}
