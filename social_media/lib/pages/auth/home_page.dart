import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/ai_navigation_bar.dart';
import 'package:social_media/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavBar(),
      appBar: const CustomAppBar(
        title: "Instagram",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(
                              "assets/images/profile_pic_${index + 1}.jpg"),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "User $index",
                          style: const TextStyle(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(thickness: 1),
            SizedBox(
              height: 480,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage(
                                  "assets/images/profile_pic_${index + 1}.jpg"),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "User $index",
                              style: const TextStyle(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Image.asset(
                          "assets/images/post_${index + 1}.jpg",
                          height: 250,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.favorite_outline),
                                const SizedBox(width: 5),
                                Text("${index + 1} likes"),
                              ],
                            ),
                            const Icon(Icons.bookmark_border),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "This is an explanation paragraph.You can write here the information about your post.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "12 minutes ago",
                          style: TextStyle(),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
