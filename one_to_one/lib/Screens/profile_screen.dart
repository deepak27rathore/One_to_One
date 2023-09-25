import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_to_one/Screens/Auth/login_screen.dart';
import 'package:one_to_one/api/apis.dart';
import 'package:one_to_one/helper/dailogs.dart';
import 'package:one_to_one/main.dart';
import 'package:one_to_one/models/chat_user.dart';

class ProfileScreen extends StatefulWidget {
  final ChatUser user;

  const ProfileScreen({super.key, required this.user});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //appbar
        appBar: AppBar(
          title: const Text('Profile Screen'),
        ),
        //floating button to add new user button
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: FloatingActionButton.extended(
              backgroundColor: Colors.redAccent,
              onPressed: () async {
                //for showonh progress dialog
                Dialogs.showProgressBar(context);

                //signout from app
                await APIs.auth.signOut().then((value) async {
                  await GoogleSignIn().signOut().then((value) {
                    //for hiding dialog
                    Navigator.pop(context);

                    //for moving to homescreen
                    Navigator.pop(context);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) => LoginScreen()));
                  });
                });
              },
              icon: const Icon(Icons.logout),
              label: const Text("LogOut")),
        ) // AppBar
        ,
        //body
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: mq.width * 0.05,
          ),
          child: Column(
            children: [
              //For adding some space
              SizedBox(width: mq.width, height: mq.height * .03),
              //profile picture
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(mq.height * .1),
                    child: CachedNetworkImage(
                      width: mq.height * .2,
                      height: mq.height * 0.2,
                      fit: BoxFit.fill,
                      imageUrl: widget.user.image,
                      errorWidget: (context, url, error) =>
                          CircleAvatar(child: Icon(CupertinoIcons.person)),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: MaterialButton(
                      onPressed: () {},
                      elevation: 1,
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: mq.height * .03),

              //user email label
              Text(widget.user.email,
                  style: const TextStyle(color: Colors.black54, fontSize: 16)),

              //for adding some space
              SizedBox(height: mq.height * .05),

              //Name input field
              TextFormField(
                initialValue: widget.user.name,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person, color: Colors.blue),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "eg. happy singh",
                    label: const Text("Name")),
              ),

              SizedBox(height: mq.height * .02),

              //About input field
              TextFormField(
                initialValue: widget.user.about,
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.info_outline,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)),
                    hintText: "Feeling Happy",
                    label: const Text("About")),
              ),

              SizedBox(height: mq.height * .05),

              //update profile button
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    minimumSize: Size(mq.width * .5, mq.height * .06)),
                onPressed: () {},
                icon: const Icon(Icons.edit, size: 28),
                label: const Text("Update", style: TextStyle(fontSize: 16)),
              )
            ],
          ),
        )); // Scaffold
  }
}