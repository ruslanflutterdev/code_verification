import 'dart:math';
import 'package:flutter/material.dart';
import '../widgets/pin_code_input.dart';
import '../widgets/resend_code_widget.dart';
import 'success_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final TextEditingController _pinController = TextEditingController();
  late String _generatedCode;

  @override
  void initState() {
    super.initState();
    _generateCode();
  }

  void _generateCode() {
    _generatedCode = (Random().nextInt(9000) + 1000).toString();
    print('Generated Code: $_generatedCode');
    _pinController.clear();
  }

  void _verifyCode(String input) {
    if (input == _generatedCode) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Неверный код'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Экран верификации')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Введите 4-значный код', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            PinCodeInput(controller: _pinController, onCompleted: _verifyCode),
            SizedBox(height: 20),
            ResendCodeWidget(onResend: _generateCode),
          ],
        ),
      ),
    );
  }
}
