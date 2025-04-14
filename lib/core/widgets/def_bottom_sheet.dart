import 'package:flutter/material.dart';

import '../constant/app_constant.dart';
import 'custom_text_form_field_widget.dart';
import 'default_material_button.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({super.key, required this.textButton, required this.onPressed});
 final String textButton;
 final Function() onPressed;
  @override
  Widget build(BuildContext context,) {
    return Padding(
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
              DefaultMaterialButton(text: textButton, onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
