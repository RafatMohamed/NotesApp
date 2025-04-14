import 'package:flutter/material.dart';
import '../../../../core/helper/my_navigator_app.dart';
import '../../../edite_note/views/edit_note_view.dart';

class CustomListViewWidget extends StatelessWidget {
  const CustomListViewWidget({super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.cyan
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsetsDirectional.all(16),
            title: const Text(
              "Flutter tips",
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
              ),
            ),
            subtitle:const Padding(
              padding:  EdgeInsetsDirectional.only(
                  start: 2
              ),
              child:  Text(
                "Build your career with Raafat Mohamed",
                style: TextStyle(
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
          const Padding(
            padding:  EdgeInsetsDirectional.only(
                top: 8,
                bottom: 16,
                end: 16
            ),
            child:  Text(
              "Mon 14/4/2025",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black38,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
