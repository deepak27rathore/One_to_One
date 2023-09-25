import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_to_one/api/apis.dart';
import 'package:one_to_one/main.dart';
import 'package:one_to_one/widgets/chat_user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('chat'),
        leading: const Icon(CupertinoIcons.home),
        actions: [
          //search user button
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),

          //more features button
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
        ],
      ),
      //floating button to add new user button
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
            onPressed: () async {
              await APIs.auth.signOut();
              await GoogleSignIn().signOut();
            },
            child: const Icon(Icons.add_comment_rounded)),
      ) // AppBar
      ,
      //body
      body: StreamBuilder(
        stream: APIs.firestore.collection('users').snapshots(),
        builder: (context, snapshot) {
          final list = [];

          if (snapshot.hasData) {
            final data = snapshot.data?.docs;
            for (var i in data!) {
              log('Data : ${jsonEncode(i.data())}');
              list.add(i.data()['name']);
            }
          }
          return ListView.builder(
              itemCount: list.length,
              padding: EdgeInsets.only(top: mq.height * 0.01),
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                //return const ChatUserCard()
                return Text('Name: ${list[index]}');
              });
        },
      ),
    ); // Scaffold
  }
}
