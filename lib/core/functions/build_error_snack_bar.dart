import 'package:flutter/material.dart';


SnackBar buildErrorSnackBar(String error) {
  return SnackBar(
    content: Text(
      error,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.red,
    duration: const Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
  );
}