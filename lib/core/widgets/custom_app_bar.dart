import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,required this.text, required this.iconButton, required this.onPress});
  final String text;
  final IconData iconButton;
  final Function() onPress;
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget> [
        Text(
          text ,
          style:const TextStyle(
            fontSize: 28,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withValues(alpha: 1.3),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
              onPressed: onPress,
              icon:  Icon(iconButton,size: 28,)
          ),
        ),
      ],
    );
  }
}