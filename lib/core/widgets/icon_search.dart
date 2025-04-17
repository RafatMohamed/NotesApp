import 'package:flutter/material.dart';
import 'package:notes_proj/features/home_note/logic/home_note_cubit.dart';
import '../../features/home_note/views/search_view.dart';
import '../helper/my_navigator_app.dart';
import '../resources/app_color.dart';

class IconSearchCubit extends StatefulWidget{
  const IconSearchCubit({super.key, required this.cubitHome});
  final HomeNoteCubit cubitHome;
  @override
  State<IconSearchCubit> createState() => _IconSearchCubitState();
}

class _IconSearchCubitState extends State<IconSearchCubit> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: AppColor(
          context,
        ).blackColor.withValues(alpha: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: IconButton(
        onPressed: () async {
          setState(() {
            widget.cubitHome.isSearch = ! widget.cubitHome.isSearch;
            widget.cubitHome.searchController.clear();
            widget.cubitHome.resetSearch();
          });
          final result = await AppNavigator.navigatorPushGo<bool>(
            context: context,
            navigatorToPage: SearchView(cubit: widget.cubitHome),
          );

          if (result == true) {
            widget.cubitHome.geDataNote();
            setState(() {
              widget.cubitHome.isSearch = false;
            });// refresh notes
          }
        },
        icon: Icon(
          widget.cubitHome.isSearch
              ? Icons.close_outlined
              : Icons.search_outlined,
          size: 28,
        ),
      ),
    );
  }
}