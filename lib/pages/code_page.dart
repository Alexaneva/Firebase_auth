import 'package:firebase_auth_newsApp/pages/widgets/basic_template.dart';
import 'package:firebase_auth_newsApp/pages/widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telephony/telephony.dart';

import '../controllers/auth_services.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  final _formKey1 = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final Telephony telephony = Telephony.instance;

  void listenToIncomingSMS(BuildContext context) {
    if (kDebugMode) {
      print("Listening to sms.");
    }
    telephony.listenIncomingSms(
        onNewMessage: (SmsMessage message) {
          if (kDebugMode) {
            print("sms received : ${message.body}");
          }

          if (message.body!.contains("phone-auth-15bdb")) {
            String otpCode = message.body!.substring(0, 6);
            setState(() {
              _codeController.text = otpCode;
              Future.delayed(const Duration(seconds: 1), () {
                if (mounted) {
                  handleSubmit(context);
                }
              });
            });
          }
        },
        listenInBackground: false);
  }

  void handleSubmit(BuildContext context) {
    if (_formKey1.currentState!.validate()) {
      AuthService.verifyWithOtp(otp: _codeController.text).then((value) {
        if (value == "Success") {
          if (mounted) {
            context.go('/main_feed');
          }
        } else {
          if (mounted) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                value,
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
            ));
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final formKey1 = GlobalKey<FormState>();
    final TextEditingController codeController = TextEditingController();
    return BaseTemplate(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const SizedBox(height: 200),
              SizedBox(
                height: 50,
                child: Form(
                  key: formKey1,
                  child: TextFormField(
                    controller: codeController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Enter your code',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                    validator: (value) {
                      if (value!.length != 6) {
                        return 'Invalid code';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              CustomButton(
                label: 'Send',
                onPressed: () {
                  listenToIncomingSMS(context);
                  if (_formKey1.currentState?.validate() ?? false) {
                    if (_codeController.text.isNotEmpty) {
                      AuthService.verifyWithOtp(
                        otp: _codeController.text,
                      ).then((value) {
                        if (mounted) {
                          if (value == 'success') {
                            context.go('/main_feed');
                          }
                        }
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Please enter a valid code'),
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
    );
  }
}
