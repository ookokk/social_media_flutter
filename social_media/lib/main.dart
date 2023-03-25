import 'package:firebase_core/firebase_core.dart';
import 'package:social_media/pages/auth/home_page.dart';
import 'package:social_media/pages/reels_page.dart';
import 'package:social_media/pages/search_page.dart';
import 'firebase_options.dart';
import 'package:social_media/pages/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/auth/login_page.dart';
import 'package:social_media/utils/custom_colors.dart';
import 'pages/notification_page.dart';
import 'pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        "/loginPage": (context) => const LoginPage(),
        "/signUp": (context) => const SignUp(),
        "/homePage": (context) => HomePage(),
        "/searchPage": (context) => SearchPage(),
        "/reelsPage": (context) => ReelsPage(),
        "/notificationPage": (context) => NotificationPage(),
        "/profilePage": (context) => ProfilePage(),
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: CustomColors.textButtonColor),
        scaffoldBackgroundColor: CustomColors.scaffoldBackgroundColor,
      ),
      home: const LoginPage(),
    );
  }
}
