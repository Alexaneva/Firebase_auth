import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInputWidget extends StatefulWidget {
  final TextEditingController controller;

  const PhoneInputWidget({super.key, required this.controller});

  @override
  State<PhoneInputWidget> createState() => _PhoneInputWidgetState();
}

class _PhoneInputWidgetState extends State<PhoneInputWidget> {
  PhoneNumber? phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            phoneNumber = number;
            widget.controller.text = number.phoneNumber ?? '';
          },
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
          ),
          ignoreBlank: false,
          autoValidateMode: AutovalidateMode.disabled,
          keyboardType: TextInputType.number,
          inputBorder: const OutlineInputBorder(),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
