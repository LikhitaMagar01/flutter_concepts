import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 5),
        title: 'sad',
        messageColor: Colors.black,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        padding: const EdgeInsets.all(20),
        titleColor: Colors.white,
        reverseAnimationCurve: Curves.easeInOut,
        icon: const Icon(Icons.error, size: 28, color: Colors.white),
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(10),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message),
      ),
    );
  }
}
