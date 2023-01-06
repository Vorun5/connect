import 'package:flutter/material.dart';

SnackBar errorSnackBar(String text) {
  return SnackBar(
    backgroundColor: Colors.redAccent,
    content: Text(text),
  );
}

SnackBar successSnackBar(String text) {
  return SnackBar(
    backgroundColor: Colors.greenAccent,
    content: Text(text),
  );
}
