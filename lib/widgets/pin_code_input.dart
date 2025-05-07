import 'package:flutter/material.dart';

class PinCodeInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onCompleted;

  const PinCodeInput({
    super.key,
    required this.controller,
    required this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLength: 4,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, letterSpacing: 12),
      decoration: InputDecoration(
        counterText: '',
        border: OutlineInputBorder(),
        hintText: '----',
      ),
      onChanged: (value) {
        if (value.length == 4) {
          onCompleted(value);
        }
      },
    );
  }
}
