import 'package:flutter/material.dart';
class TextFormFieldApp extends StatefulWidget {
  const TextFormFieldApp({
    super.key,
    this.iconSuffix = false,
    this.maxLine = 1,
    required this.labelText,
    this.labelFontWeight = FontWeight.normal,
    this.labelFontSize = 19,
    required this.labelColor ,
    this.labelFontStyle = FontStyle.normal,
    this.labelTextAlign = TextAlign.start,
    required this.hintText,
    this.hintFontWeight = FontWeight.w200,
    this.hintFontSize =14,
   required this.hintColor ,
    this.hintFontStyle = FontStyle.normal,
    this.hintTextAlign = TextAlign.start,
    this.radius =15,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    required this.borderDecorationColor,
    this.validator,
    required this.onFieldSubmitted,
    this.focusNode,
    required this.controller,
    this.onSaved,
  });

  final bool iconSuffix;
  final int maxLine;
  final Color borderDecorationColor;
  final String hintText;
  final FontWeight hintFontWeight;
  final double hintFontSize;
  final Color hintColor;
  final FontStyle? hintFontStyle;
  final TextAlign? hintTextAlign;
  final String labelText;
  final FontWeight labelFontWeight;
  final double labelFontSize;
  final Color labelColor;
  final FontStyle? labelFontStyle;
  final TextAlign? labelTextAlign;
  final double radius;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final Function(String) onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final FocusNode? focusNode;
  final TextEditingController controller;

  @override
  State<TextFormFieldApp> createState() => _TextFormFieldAppState();
}


class _TextFormFieldAppState extends State<TextFormFieldApp> {
  bool _isFieldFilled = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        _isFieldFilled = widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent, // Keep background white
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(
          color:
              _isFieldFilled
                  ? widget.borderDecorationColor
                  : Colors.white, // Change border color dynamically
          width: 2,
        ),
      ),
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      child: TextFormField(
        focusNode: widget.focusNode,
        controller: widget.controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        enableSuggestions: true,
        onSaved: widget.onSaved,
        validator: widget.validator,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          border: InputBorder.none,
          // icon:
          //     widget.iconSuffix
          //         ? IConSvgWidget(
          //           radius: AppSizeHW.s5,
          //           width: AppSizeHW.s35,
          //           height: AppSizeHW.s35,
          //           colorContainer: MyColors.containerHomeColor,
          //           icon: SvgPicture.asset(
          //             width: AppSizeHW.s20,
          //             height: AppSizeHW.s20,
          //             MyIcons.iconHomeSvg,
          //             fit: LayoutBoxFit.boxFitNone,
          //           ),
          //         )
          //         : null,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.labelColor,
            fontSize: widget.labelFontSize,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: widget.hintColor,
            fontSize: widget.hintFontSize,
            fontWeight: widget.hintFontWeight,
          ),
        ),
        keyboardType: widget.keyboardType,
        maxLines: widget.maxLine,
        textInputAction: widget.textInputAction,
        textAlign: TextAlign.start,
        style: TextStyle(
          color: widget.hintColor,
          fontSize: widget.hintFontSize,
          fontWeight: widget.hintFontWeight,
        ),
      ),
    );
  }
}
