import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;

  const CustomAppBar({Key? key, required this.title})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.camera_alt_outlined),
      ),
      title: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 35, fontFamily: 'GreatVibes'),
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.message_outlined))
      ],
      automaticallyImplyLeading: true,
    );
  }
}
