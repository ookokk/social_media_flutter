import 'package:flutter/material.dart';
import 'ai_navigation_bar.dart';

class NotificationPage extends StatefulWidget {
  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Container(
            child: TextButton(
              onPressed: null,
              child: Row(
                children: const [
                  Text(
                    "Following",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                        fontFamily: "Satisfy"),
                  ),
                  SizedBox(width: 130),
                  Text(
                    "You",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white70,
                        fontFamily: "Satisfy"),
                  ),
                ],
              ),
            ),
          )),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                        "assets/images/profile_pic_${index + 2}.jpg"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: const Text(
                      "Lorem ipsum dolor sit amet,\n consectetur adipiscing elit",
                      style: TextStyle(fontSize: 15, fontFamily: "Satisfy"),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      TextButton(
                          onPressed: null,
                          child: Text(
                            "Following",
                            style: TextStyle(),
                          )),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
