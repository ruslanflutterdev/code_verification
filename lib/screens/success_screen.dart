import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Успех')),
      body: Center(
        child: Text('Код подтверждён!', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
