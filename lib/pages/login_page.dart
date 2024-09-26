import 'package:firebase_auth_newsApp/pages/widgets/basic_template.dart';
import 'package:firebase_auth_newsApp/pages/widgets/custom_button.dart';
import 'package:firebase_auth_newsApp/pages/widgets/phone_Input_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../controllers/auth_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseTemplate(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 200),
                PhoneInputWidget(controller: _phoneController),
                CustomButton(
                  label: 'Send code',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (_phoneController.text.isNotEmpty) {
                        AuthService.sentCode(
                          phone: _phoneController.text,
                          errorStep: () => ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Error in sending code'),
                            backgroundColor: Colors.red,
                          )),
                          nextStep: () {
                            context.go('/code_page');
                          },
                        );
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Please enter a valid phone number'),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
