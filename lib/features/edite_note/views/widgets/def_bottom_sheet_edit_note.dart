import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../core/widgets/default_material_button.dart';

class DefaultBottomSheetEditeNote extends StatelessWidget {
   DefaultBottomSheetEditeNote({super.key,});
 final TextEditingController titleController =TextEditingController();
 final TextEditingController descController =TextEditingController();
 final GlobalKey<FormState> keyForm = GlobalKey();
  @override
  Widget build(BuildContext context,) {
    return Form(
      key: keyForm,
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: Column(
              spacing: 50,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    TextFormFieldApp(
                      textInputAction: TextInputAction.next ,
                      controller: TextEditingController(),
                      onFieldSubmitted: (p0) {},
                      labelText: 'Title',
                      labelColor: kPrimaryColor,
                      hintText: '',
                    ),
                    TextFormFieldApp(
                      textInputAction: TextInputAction.done ,
                      controller: TextEditingController(),
                      onFieldSubmitted: (p0) {},
                      labelText: 'Content',
                      maxLine: 5,
                      labelColor: kPrimaryColor,
                      hintText: '',
                    ),
                  ],
                ),
                DefaultMaterialButton(
                  text: "Save",
                  onPressed: () {
                    if(keyForm.currentState!.validate()){
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
