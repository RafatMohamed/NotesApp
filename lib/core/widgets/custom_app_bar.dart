import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/app/logic/them_toggle_cubit.dart';
import 'package:notes_proj/app/logic/them_toggle_state.dart';
import 'package:notes_proj/features/home_note/logic/home_note_cubit.dart';
import 'icon_search.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, required this.text});
  final String text;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final cubitHome = BlocProvider.of<HomeNoteCubit>(context);
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(widget.text, style: const TextStyle(fontSize: 28)),
                Row(
                  children: [
                    IconSearchCubit(cubitHome: cubitHome,),
                    BlocBuilder<ThemToggleCubit, ThemToggleState>(
                      builder: (context, state) {
                        final cubit = context.read<ThemToggleCubit>();
                        return IconButton(
                          onPressed: () {
                            cubit.toggleTheme();
                          },
                          icon: Icon(
                            cubit.isDark
                                ? Icons.brightness_4_outlined
                                : Icons.brightness_4,
                            size: 28,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
