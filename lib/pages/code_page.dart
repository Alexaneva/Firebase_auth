import 'package:flutter/material.dart';

class CodePage extends StatefulWidget {
  const CodePage({super.key});

  @override
  State<CodePage> createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  @override
  Widget build(BuildContext context) {
    final _formKey1 = GlobalKey<FormState>();
    final TextEditingController _codeController = TextEditingController();

    return Scaffold(
      body: Column(
        children: [
          const Text('Enter your code'),
          SizedBox(
            height: 12,
            child: Form(
              key: _formKey1,
              child: TextFormField(
                controller: _codeController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Enter your code',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
                validator: (value) {
                  if(value!.length !=6) {
                    return 'Invalid code';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
