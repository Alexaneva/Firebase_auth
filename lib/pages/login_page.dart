import 'package:firebase_auth_newsApp/pages/widgets/basic_template.dart';
import 'package:firebase_auth_newsApp/pages/widgets/custom_button.dart';
import 'package:firebase_auth_newsApp/pages/widgets/phone_Input_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 200),
              PhoneInputWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
