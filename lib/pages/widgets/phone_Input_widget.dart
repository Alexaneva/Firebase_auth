import 'package:firebase_auth_newsApp/controllers/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import 'custom_button.dart';

class PhoneInputWidget extends StatefulWidget {
  const PhoneInputWidget({super.key});

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();
  PhoneNumber? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child:  InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                phoneNumber = number;
                _phoneController.text = number.phoneNumber ?? '';
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              ),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              keyboardType: TextInputType.number,
              inputBorder: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          CustomButton(
            label: 'Send code',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Проверяем, что номер не пустой
                if (_phoneController.text.isNotEmpty) {
                  AuthService.sentCode(
                    phone: _phoneController.text,
                    errorStep: () =>
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Error in sending code'),
                          backgroundColor: Colors.red,
                        )),
                    nextStep: () => context.go('/code_page'),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter a valid phone number'),
                    backgroundColor: Colors.red,
                  ));
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
