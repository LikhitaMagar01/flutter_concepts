import 'package:flutter/material.dart';
import 'package:mvvm/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Utils.snackBar('did you get your snack', context);
            Utils.flushBarErrorMessage('No internet connection', context);
            Utils.toastMessage('clicked');
          },
          child: const Text('Click'),
        ),
      ),
    );
  }
}
