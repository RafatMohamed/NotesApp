import 'package:flutter/material.dart';
import 'package:notes_proj/core/constant/app_constant.dart';
import '../../../core/widgets/custom_app_bar.dart';

class EditeNoteView  extends StatelessWidget{
  const EditeNoteView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
         child: Column(
           children: [
             CustomAppBar(
               text: "Edite",
               onPress: () {},
               iconButton: Icons.search_outlined,
             ),
           ],
         ),
       ),
     ),
   );
  }

}
