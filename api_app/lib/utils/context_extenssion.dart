import 'package:flutter/material.dart';

extension ContextExtenssion on BuildContext{

  void showSnackBar({required String message, bool error = false}){
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
      ),
    );
  }

}