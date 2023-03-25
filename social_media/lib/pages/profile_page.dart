import 'package:flutter/material.dart';

import '../widgets/profile_header_widget.dart';
import 'ai_navigation_bar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CustomNavBar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "okok",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.black,
                ),
                onPressed: () => print("Add"),
              ),
              IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () => print("Add"),
              )
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.white,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: [
                    MyTab(const Icon(Icons.grid_on_sharp, color: Colors.black)),
                    MyTab(const Icon(Icons.camera_alt_outlined,
                        color: Colors.black)),
                    MyTab(const Icon(Icons.perm_contact_cal_outlined,
                        color: Colors.black)),
                  ],
                ),
              ),
              Expanded(
                  child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    MySizedBox(),
                    MySizedBox(),
                    MySizedBox(),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Tab MyTab(Icon ikon) {
    return Tab(icon: ikon);
  }

  SizedBox MySizedBox() {
    return const SizedBox(
      width: 130,
      child: Image(
          image: AssetImage(
        "assets/images/reels5.jpg",
      )),
    );
  }
}
