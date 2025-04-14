import 'package:flutter/material.dart';
import 'package:notes_proj/core/constant/app_constant.dart';
import '../../../core/widgets/def_bottom_sheet.dart';

class AddNoteView  extends StatelessWidget{
  const AddNoteView({super.key});

  @override
  Widget build(BuildContext context) {
   return FloatingActionButton(
     backgroundColor: kPrimaryColor,
     onPressed: () {
       showModalBottomSheet(
         isScrollControlled: true,
          useSafeArea: true,
         shape: OutlineInputBorder(
           borderRadius: BorderRadius.circular(16)
         ),
         context: context,
         builder:(context) =>  DefaultBottomSheet(
           textButton: "Add",
           onPressed: () {},
         ),
       );
     },
     child: const Icon(Icons.add,color: Colors.black),
   );
  }

}
