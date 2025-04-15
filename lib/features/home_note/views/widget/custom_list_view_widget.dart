import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notes_proj/features/add_note/data/model.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../edite_note/views/edit_note_view.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({super.key, required this.note, });
  final AddNoteModel note;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(note.color),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsetsDirectional.all(16),
            title: Text(
              note.title,
              style: const TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 2
              ),
              child:  Text(
                note.desc,
                style:const TextStyle(
                  fontSize: 18,
                  color: Colors.black38,
                ),
              ),
            ),
            trailing:const Icon(
              Icons.delete,
              size: 30,
              color: Colors.black38,
            ),
            onTap: () {
              AppNavigator.navigatorPushGo(context: context, navigatorToPage: const EditeNoteView(
              ));
            },
          ),
           Padding(
            padding: const EdgeInsetsDirectional.only(
                top: 8,
                bottom: 16,
                end: 16
            ),
            child:Text(
              formatDate(note.createdAt),
              style:const TextStyle(
                fontSize: 18,
                color: Colors.black38,
              ),
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
