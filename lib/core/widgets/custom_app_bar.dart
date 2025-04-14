import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/app/logic/them_toggle_cubit.dart';
import 'package:notes_proj/app/logic/them_toggle_state.dart';
import 'package:notes_proj/core/resources/app_color.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key, required this.text,
    required this.iconButton,
    required this.onPress,
  });

  final String text;
  final IconData iconButton;
  final Function() onPress;


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              text,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor(context).blackColor.withValues(alpha: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: IconButton(
                      onPressed: onPress,
                      icon: Icon(iconButton, size: 28,)
                  ),
                ),
                BlocBuilder<ThemToggleCubit, ThemToggleState>(
                  builder: (context, state) {
                    final cubit = context.read<ThemToggleCubit>();
                    return IconButton(
                        onPressed: () {
                          cubit.toggleThem();
                        },
                        icon: Icon(
                        cubit.isDark?Icons.brightness_4_outlined:Icons.brightness_4,
                          size: 28,
                        )
                    );
                  },
                ),
              ],
            ),
          ],
        );
      }
    );
  }
}