import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              onPressed: () {}, child: const Icon(Icons.add_comment_rounded)),
        ) // AppBar
        ); // Scaffold
  }
}
