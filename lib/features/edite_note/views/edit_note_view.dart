import 'package:flutter/material.dart';
import 'package:notes_proj/features/edite_note/views/widgets/def_bottom_sheet_edit_note.dart';
import '../../../core/widgets/custom_app_bar.dart';

class EditeNoteView  extends StatelessWidget{
  const EditeNoteView({super.key,});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal:16 ),
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 8),
               child: CustomAppBar(
                 text: "Edite Note",
                 onPress: () {},
                 iconButton: Icons.check_sharp,
               ),
             ),
             DefaultBottomSheetEditeNote(),
           ],
         ),
       ),
     ),
   );
  }
}
