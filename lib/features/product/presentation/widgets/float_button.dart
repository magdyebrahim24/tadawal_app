import 'package:flutter/material.dart';

Widget floatButton({
  required VoidCallback onPressFun,
  required IconData icon,
}) {
  return MaterialButton(
    onPressed: onPressFun,
    color: Colors.white,
    elevation: .8,
    height: 50,
    minWidth: 67,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        ),
    child: Icon(icon, size: 24),
  );
}
