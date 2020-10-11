import 'package:flutter/material.dart';

class TextWritting extends StatelessWidget {
  TextEditingController controller;
  String image, htext;
  bool obscureText;
  TextWritting(String image, String htext, bool obscureText, TextEditingController controller) {
    this.image = image;
    this.htext = htext;
    this.obscureText = obscureText;
    this.controller = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            suffixIcon: ImageIcon(
              AssetImage(image),
              color: Color(0xFF463EC9),
            ),
            hintText: htext,
            hintStyle: TextStyle(fontFamily: 'PoppinsMed', fontSize: 17.0)),
        obscureText: obscureText,
      ),
    );
  }
}
