import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_proj/core/helper/notify_app.dart';

import '../../../../core/data/model.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../edite_note/views/edit_note_view.dart';
import '../../logic/home_note_cubit.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({
    super.key,
    required this.note,
    required this.index,
    this.isShow = false,
  });

  final NoteModel note;
  final int index;
  final bool isShow;
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color(note.color);
    Color textColor = ThemeData.estimateBrightnessForColor(backgroundColor) == Brightness.dark
        ? Colors.white
        : Colors.black;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: textColor.withGreen(5)
        ),
        borderRadius: BorderRadius.circular(15),
        color: Color(note.color),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsetsDirectional.all(16),
            title: Text(
              note.title,
              style:  TextStyle(fontSize: 26, color: textColor ),
            ),
            subtitle: Padding(
              padding: const EdgeInsetsDirectional.only(start: 2),
              child: Text(
                note.desc,
                style: TextStyle(fontSize: 18, color:textColor.withValues(alpha: 0.5)),
              ),
            ),
            trailing: isShow ? const Text("") :IconButton(
              onPressed: () async {
                // ScaffoldMessenger.of(context).showSnackBar(
                //     AppNotify.snackBar(widget:const Text("delete Success"), context: context),
                //     );
                AppNotify.showErrorDialog(
                  alertMess: "Delete Note",
                  message: "you Want to delete this Note ",
                  context: context,
                  onPressed: () {
                    note.delete();
                    AppNavigator.navigatorPop(context: context);
                    BlocProvider.of<HomeNoteCubit>(context).geDataNote();
                  },
                );
                BlocProvider.of<HomeNoteCubit>(context).geDataNote();
              },
              icon: Icon(Icons.delete, size: 30, color: textColor.withValues(alpha: 0.5)),
            ),
            onTap: () {
              AppNavigator.navigatorPushGo(
                context: context,
                navigatorToPage: EditeNoteView(note: note, index: index,),
              );
            },
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(
              top: 8,
              bottom: 16,
              end: 16,
            ),
            child: Text(
              formatDate(note.createdAt),
              style:  TextStyle(fontSize: 18, color: textColor.withValues(alpha: 0.5)),
            ),
          ),
        ],
      ),
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
