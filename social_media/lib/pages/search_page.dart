import 'package:flutter/material.dart';
import 'package:social_media/utils/custom_colors.dart';
import 'ai_navigation_bar.dart';

class SearchPage extends StatefulWidget {
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const TextField(
          decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.white),
              border: InputBorder.none),
        ),
        leading: const Icon(Icons.search),
      ),
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
                  Center(
                    child: Text(
                      "User $index",
                      style: const TextStyle(fontSize: 25),
                    ),
                    widthFactor: 1.5,
                  ),
                ],
              ),
            );
          }),
    );
  }
}
