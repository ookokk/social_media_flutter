import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media/pages/auth/home_page.dart';
import 'package:social_media/utils/custom_colors.dart';
import '../../service/auth_service.dart';
import '../../utils/custom_text_style.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String email, password, fullname, username;
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
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      titleText(),
                      customSizedBox(),
                      emailTextField(),
                      customSizedBox(),
                      passwordTextField(),
                      customSizedBox(),
                      fullNameTextField(),
                      customSizedBox(),
                      usernameTextField(),
                      customSizedBox(),
                      signUpButton(),
                      backToLoginPage()
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField emailTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Fill correctly";
        } else {}
      },
      onSaved: (value) {
        email = value!;
      },
      style: const TextStyle(color: Colors.white70),
      decoration: customInputDecoration("Email"),
    );
  }

  TextFormField fullNameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill in the blanks correctly";
        } else {}
      },
      onSaved: (value) {
        fullname = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Name Surname"),
    );
  }

  TextFormField usernameTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Please fill in the blanks correctly";
        } else {}
      },
      onSaved: (value) {
        username = value!;
      },
      style: const TextStyle(color: Colors.white),
      decoration: customInputDecoration("Username"),
    );
  }

  TextFormField passwordTextField() {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return "Fill in the blanks correctly";
        } else {}
      },
      onSaved: (value) {
        password = value!;
      },
      obscureText: true,
      style: const TextStyle(color: Colors.white70),
      decoration: customInputDecoration("Password"),
    );
  }

  Center signUpButton() {
    return Center(
        child: TextButton(
            onPressed: signUp,
            child: const Text(
              "Sign Up",
              style: CustomTextStyle2.paragraphTextStyle,
            )));
  }

  void signUp() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      final result =
          await authService.signUp(email, username, fullname, password);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    } else {}
  }

  backToLoginPage() {
    return Center(
        child: TextButton(
            onPressed: () => Navigator.pushNamed(context, "/loginPage"),
            child: const Text(
              "Back",
              style: CustomTextStyle2.paragraphTextStyle,
            )));
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
