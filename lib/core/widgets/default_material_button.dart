import 'package:flutter/material.dart';
import 'package:notes_proj/core/constant/app_constant.dart';

class DefaultMaterialButton extends StatelessWidget {
  const DefaultMaterialButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: MediaQuery.sizeOf(context).width,
      onPressed: onPressed,
      color: kPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}
