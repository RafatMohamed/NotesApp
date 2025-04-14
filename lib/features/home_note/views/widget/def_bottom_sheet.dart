import 'package:flutter/material.dart';

import '../../../../core/constant/app_constant.dart';
import '../../../../core/widgets/custom_text_form_field_widget.dart';
import '../../../../core/widgets/default_material_button.dart';

class DefaultBottomSheet extends StatelessWidget {
  const DefaultBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          spacing: 50,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              spacing: 10,
              children: [
                TextFormFieldApp(
                  controller: TextEditingController(),
                  onFieldSubmitted: (p0) {},
                  labelText: 'Title',
                  labelColor: kPrimaryColor,
                  hintText: '',
                  hintColor: Colors.white,
                  borderDecorationColor: Colors.black,
                ),
                TextFormFieldApp(
                  controller: TextEditingController(),
                  onFieldSubmitted: (p0) {},
                  labelText: 'Content',
                  maxLine: 5,
                  labelColor: kPrimaryColor,
                  hintText: '',
                  hintColor: Colors.white,
                  borderDecorationColor: Colors.black,
                ),
              ],
            ),
            DefaultMaterialButton(text: "Add", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
