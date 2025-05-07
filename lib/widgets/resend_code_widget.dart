import 'dart:async';
import 'package:flutter/material.dart';

class ResendCodeWidget extends StatefulWidget {
  final VoidCallback onResend;

  const ResendCodeWidget({super.key, required this.onResend});

  @override
  State<ResendCodeWidget> createState() => _ResendCodeWidgetState();
}

class _ResendCodeWidgetState extends State<ResendCodeWidget> {
  int _secondsRemaining = 60;
  late Timer _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _onResendPressed() {
    widget.onResend();
    setState(() {
      _secondsRemaining = 60;
      _canResend = false;
    });
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Осталось времени: $_secondsRemaining сек'),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _canResend ? _onResendPressed : null,
          child: Text('Отправить код повторно'),
        ),
      ],
    );
  }
}
