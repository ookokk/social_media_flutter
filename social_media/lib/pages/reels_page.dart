import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/ai_navigation_bar.dart';

class ReelsPage extends StatelessWidget {
  ReelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          const Icon(
            Icons.favorite,
            size: 35,
            color: Colors.white,
          ),
          const SizedBox(
            height: 20,
          ),
          const Icon(Icons.comment, size: 35, color: Colors.white),
          const SizedBox(height: 20),
          const Icon(Icons.send, size: 35, color: Colors.white),
          const SizedBox(height: 20),
          const Icon(Icons.more_vert, size: 35, color: Colors.white),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    //margin: EdgeInsets.only(top: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/reels${index + 1}.jpg",
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
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

/*
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
floatingActionButton: Column(
children: [
IconButton(onPressed: null, icon: Icon(Icons.favorite)),
IconButton(onPressed: null, icon: Icon(Icons.details)),
IconButton(onPressed: null, icon: Icon(Icons.send)),
],
),*/
