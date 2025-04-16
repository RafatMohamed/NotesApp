import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_proj/app/logic/them_toggle_cubit.dart';
import 'package:notes_proj/app/logic/them_toggle_state.dart';
import 'package:notes_proj/core/helper/my_navigator_app.dart';
import 'package:notes_proj/core/resources/app_color.dart';
import 'package:notes_proj/features/home_note/logic/home_note_cubit.dart';
import '../../features/home_note/views/search_view.dart';

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
                    Container(
                      decoration: BoxDecoration(
                        color: AppColor(
                          context,
                        ).blackColor.withValues(alpha: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          setState(() {
                            cubitHome.isSearch = ! cubitHome.isSearch;
                            cubitHome.searchController.clear();
                            cubitHome.resetSearch();
                          });
                          final result = await AppNavigator.navigatorPushGo<bool>(
                            context: context,
                            navigatorToPage: SearchView(cubit: cubitHome),
                          );

                          if (result == true) {
                            cubitHome.geDataNote();
                            setState(() {
                              cubitHome.isSearch = false;
                            });// refresh notes
                          }
                        },
                        icon: Icon(
                          cubitHome.isSearch
                              ? Icons.close_outlined
                              : Icons.search_outlined,
                          size: 28,
                        ),
                      ),
                    ),
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
