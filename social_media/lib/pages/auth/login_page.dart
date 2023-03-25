import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/service/auth_service.dart';
import 'package:social_media/utils/custom_colors.dart';
import 'package:social_media/widgets/custom_text_button.dart';
import '../../utils/custom_text_style.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email = "osk@hotmail.com", password = "123456";
  final formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  final authService = AuthService();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustomColors.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * .25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/topImage.png"))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      titleText(),
                      customSizedBox(),
                      usernameTextField(),
                      customSizedBox(),
                      passwordTextField(),
                      customSizedBox(),
                      signInButton(),
                      customSizedBox(),
                      CustomTextButton(
                        buttonText: "Sign Up",
                        onPressed: () =>
                            Navigator.pushNamed(context, "/signUp"),
                      ),
                      customSizedBox(),
                      TextButton(
                          child: const Text("Guest Login"),
                          onPressed: () async {
                            final result = await authService.signInAnonymous();
                            if (result != null) {
                              Navigator.pushReplacementNamed(
                                  context, "/homePage");
                            } else {
                              print("hata ile karsilastik");
                            }
                          }),
                      forgotPasswordButton(),
                      customSizedBox(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center signUpButton() {
    return Center(
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, "/signUp"),
        child: const Text(
          "Sign Up",
          style: CustomTextStyle2.paragraphTextStyle,
        ),
      ),
    );
  }

  Center signInButton() {
    return Center(
      child: TextButton(
        onPressed: signIn,
        child: Container(
          height: 50,
          width: 150,
          margin: const EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0)),
          child: const Center(
            child: Text(
              "Sign In",
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result = await authService.signIn(email, password);
      if (result == "success") {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error.."),
                content: Text(result!),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Return"))
                ],
              );
            });
      }
    }
  }

  Future<void> myshowAlertDialog({
    required BuildContext context,
    required String title,
    required String message,
  }) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tamam'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Center forgotPasswordButton() {
    return Center(
        child: TextButton(
            onPressed: () async {
              myshowAlertDialog(
                  context: context,
                  message: "Password reset mail sent",
                  title: "Succes");
            },
            child: const Text(
              "Forgot Password?",
              style: CustomTextStyle2.paragraphTextStyle,
            )));
  }

  TextField passwordTextField() {
    return TextField(
      obscureText: true,
      style: const TextStyle(color: Colors.white70),
      decoration: customInputDecoration("Password"),
    );
  }

  TextField usernameTextField() {
    return TextField(
      style: const TextStyle(color: Colors.white70),
      decoration: customInputDecoration("Email"),
    );
  }

  Text titleText() {
    return const Text(
      "Welcome",
      style: CustomTextStyle.titleTextStyle,
    );
  }

  Widget customSizedBox() => const SizedBox(
        height: 20,
      );

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
        suffixStyle: const TextStyle(color: Colors.white70),
        hintStyle: const TextStyle(color: Colors.grey),
        hintText: hintText,
        labelStyle: const TextStyle(color: Colors.white70),
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey)));
  }
}
