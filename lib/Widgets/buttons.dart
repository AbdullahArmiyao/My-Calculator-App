import 'package:flutter/material.dart';


Widget calcButton(String buttonText, Function(String) onPressed) {
  return Expanded(
    child: ElevatedButton(
      onPressed: () => onPressed(buttonText),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 20),
        overlayColor: Colors.lightBlue,
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 24),
      ),
    ),
  );
}
